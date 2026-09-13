# frozen_string_literal: true
require "fileutils"
require "minitest/autorun"
require "open3"
require "tmpdir"

class WaitForFormulaChecksTest < Minitest::Test
  SCRIPT = File.expand_path("../script/wait-for-formula-checks", __dir__)

  def test_succeeds_when_checks_register_after_extended_delay
    run_waiter(delay: 25) { |status, count, output| assert status.success?, output; assert_equal 25, count }
  end

  def test_times_out_when_checks_exceed_configured_max_attempts
    run_waiter(delay: 10, attempts: 5) do |status, count, output|
      refute status.success?
      assert_equal 5, count
      assert_includes output, "No formula checks were registered"
    end
  end

  def test_succeeds_when_checks_register_immediately
    run_waiter(delay: 1) { |status, count, output| assert status.success?, output; assert_equal 1, count }
  end

  def test_waits_when_checks_disappear_before_watch_starts
    run_waiter(delay: 2) { |status, count, output| assert status.success?, output; assert_equal 2, count }
  end

  def test_real_failed_checks_are_not_retried
    run_waiter(delay: 1, error: "Install on macos-15 fail") do |status, count, _output|
      refute status.success?
      assert_equal 1, count
    end
  end

  def test_authentication_failure_is_not_disguised_as_missing_checks
    run_waiter(delay: 1, error: "HTTP 403: Resource not accessible") do |status, count, output|
      refute status.success?
      assert_equal 1, count
      assert_includes output, "HTTP 403"
    end
  end

  private

  def run_waiter(delay:, attempts: 30, error: "")
    Dir.mktmpdir do |dir|
      state = File.join(dir, "count")
      fake = File.join(dir, "gh")
      File.write(fake, <<~'SH')
        #!/usr/bin/env bash
        set -euo pipefail
        if [[ "$*" != *"--watch"* ]]; then
          echo 1
          exit 0
        fi
        count=$(cat "$STATE_FILE" 2>/dev/null || echo 0)
        count=$((count + 1))
        echo "$count" > "$STATE_FILE"
        if ((count < CHECK_DELAY)); then
          echo "no checks reported on the branch" >&2
          exit 1
        fi
        if [[ -n "$CHECK_ERROR" ]]; then
          echo "$CHECK_ERROR" >&2
          exit 1
        fi
        echo "Install on macos-15 pass"
      SH
      FileUtils.chmod(0o755, fake)
      env = {"PATH" => "#{dir}:#{ENV.fetch('PATH')}", "STATE_FILE" => state,
             "CHECK_DELAY" => delay.to_s, "CHECK_ERROR" => error,
             "WAIT_FOR_CHECKS_INTERVAL" => "0", "WAIT_FOR_CHECKS_ATTEMPTS" => attempts.to_s}
      out, err, status = Open3.capture3(env, SCRIPT, "https://github.com/quality-gates/homebrew-tap/pull/75")
      yield status, File.read(state).to_i, out + err
    end
  end
end
