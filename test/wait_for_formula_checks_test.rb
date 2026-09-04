# frozen_string_literal: true

require "fileutils"
require "minitest/autorun"
require "open3"
require "tmpdir"

class WaitForFormulaChecksTest < Minitest::Test
  SCRIPT = File.expand_path("../script/wait-for-formula-checks", __dir__)

  def test_succeeds_when_checks_register_after_extended_delay
    with_fake_gh(succeed_on_attempt: 25) do |fake_bin, log, state_file|
      env = {
        "PATH" => "#{fake_bin}:#{ENV.fetch("PATH")}",
        "GH_LOG" => log,
        "STATE_FILE" => state_file,
        "WAIT_FOR_CHECKS_INTERVAL" => "0"
      }
      pr_url = "https://github.com/quality-gates/homebrew-tap/pull/42"
      stdout, stderr, status = Open3.capture3(env, SCRIPT, pr_url)

      assert status.success?, "#{stdout}\n#{stderr}"
      calls = File.read(log)
      assert_includes calls, "pr checks #{pr_url} --watch --fail-fast --interval 0"
    end
  end

  def test_times_out_when_checks_exceed_configured_max_attempts
    with_fake_gh(succeed_on_attempt: 10) do |fake_bin, log, state_file|
      env = {
        "PATH" => "#{fake_bin}:#{ENV.fetch("PATH")}",
        "GH_LOG" => log,
        "STATE_FILE" => state_file,
        "WAIT_FOR_CHECKS_ATTEMPTS" => "5",
        "WAIT_FOR_CHECKS_INTERVAL" => "0"
      }
      pr_url = "https://github.com/quality-gates/homebrew-tap/pull/42"
      _stdout, stderr, status = Open3.capture3(env, SCRIPT, pr_url)

      refute status.success?
      assert_equal 1, status.exitstatus
      assert_includes stderr, "No formula checks were registered for #{pr_url}."
    end
  end

  def test_succeeds_when_checks_register_immediately
    with_fake_gh(succeed_on_attempt: 1) do |fake_bin, log, state_file|
      env = {
        "PATH" => "#{fake_bin}:#{ENV.fetch("PATH")}",
        "GH_LOG" => log,
        "STATE_FILE" => state_file,
        "WAIT_FOR_CHECKS_INTERVAL" => "0"
      }
      pr_url = "https://github.com/quality-gates/homebrew-tap/pull/42"
      stdout, stderr, status = Open3.capture3(env, SCRIPT, pr_url)

      assert status.success?, "#{stdout}\n#{stderr}"
    end
  end

  private

  def with_fake_gh(succeed_on_attempt:)
    Dir.mktmpdir do |dir|
      fake_bin = File.join(dir, "bin")
      FileUtils.mkdir_p(fake_bin)
      fake_gh = File.join(fake_bin, "gh")
      log = File.join(dir, "gh.log")
      state_file = File.join(dir, "attempt.count")
      File.write(state_file, "0")

      File.write(fake_gh, <<~'BASH')
        #!/usr/bin/env bash
        set -euo pipefail
        printf '%s\n' "$*" >> "$GH_LOG"

        if [[ "$1" == "pr" && "$2" == "checks" ]]; then
          if [[ "$*" == *"--watch"* ]]; then
            exit 0
          fi

          count="$(cat "$STATE_FILE")"
          count=$((count + 1))
          echo "$count" > "$STATE_FILE"

          if [[ $count -ge TARGET_ATTEMPT ]]; then
            echo "1"
            exit 0
          else
            echo "no checks reported on the branch" >&2
            exit 1
          fi
        fi

        echo "unexpected gh call: $*" >&2
        exit 1
      BASH
      content = File.read(fake_gh).gsub("TARGET_ATTEMPT", succeed_on_attempt.to_s)
      File.write(fake_gh, content)
      FileUtils.chmod(0o755, fake_gh)

      yield fake_bin, log, state_file
    end
  end
end
