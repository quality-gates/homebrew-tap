# frozen_string_literal: true
require "minitest/autorun"
require "open3"
require "tmpdir"
require "fileutils"
require "yaml"

class StartFormulaChecksTest < Minitest::Test
  ROOT = File.expand_path("..", __dir__)

  def test_publisher_explicitly_tests_the_pr_head_and_base
    run_dispatch do |status, log, output|
      assert status.success?, output
      assert_includes log, "workflow run test.yml --ref automation/messpy-v0.1.13 -f base_sha=#{'b' * 40}"
      assert_includes log, "run watch 123 --exit-status"
      refute_includes log, "run watch 999"
    end
  end

  def test_publisher_propagates_test_failure
    run_dispatch(failure: true) { |status, _log, _output| refute status.success? }
  end

  def test_publisher_does_not_accept_a_run_for_a_different_commit
    run_dispatch(wrong_head: true) do |status, log, output|
      refute status.success?
      refute_includes log, "run watch"
      assert_includes output, "dispatch was not found"
    end
  end

  private

  def run_dispatch(failure: false, wrong_head: false)
    workflow = YAML.load_file(File.join(ROOT, ".github/workflows/publish-formula.yml"))
    assert_equal "write", workflow.fetch("permissions").fetch("actions")
    step = workflow.fetch("jobs").fetch("update").fetch("steps").find { |s| s["name"] == "Start formula checks" }
    Dir.mktmpdir do |dir|
      fake = File.join(dir, "gh")
      File.write(fake, <<~'SH')
        #!/usr/bin/env bash
        set -euo pipefail
        echo "$*" >> "$GH_LOG"
        if [[ "$1 $2" == 'pr view' ]]; then
          printf '{"state":"OPEN","headRefName":"automation/messpy-v0.1.13","headRefOid":"%040d","baseRefOid":"%040d"}\n' 0 0 | sed 's/0000000000000000000000000000000000000000/aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/;s/0000000000000000000000000000000000000000/bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/'
        elif [[ "$1 $2" == 'workflow run' ]]; then
          for arg in "$@"; do
            if [[ "$arg" == request_id=* ]]; then echo "${arg#request_id=}" > "$GH_REQUEST"; fi
          done
        elif [[ "$1 $2" == 'run list' ]]; then
          printf '[{"databaseId":999,"displayTitle":"Test formula older","headSha":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"},{"databaseId":123,"displayTitle":"Test formula %s","headSha":"%s"}]\n' "$(cat "$GH_REQUEST")" "$CHECK_HEAD"
        elif [[ "$1 $2" == 'run watch' ]]; then
          exit "$CHECK_RESULT"
        else
          echo "Unexpected gh call" >&2
          exit 1
        fi
      SH
      FileUtils.chmod(0o755, fake)
      log = File.join(dir, "log")
      env = {"PATH" => "#{dir}:#{ENV.fetch('PATH')}", "PR_URL" => "https://github.com/quality-gates/homebrew-tap/pull/75",
             "GH_LOG" => log, "GH_REQUEST" => File.join(dir, "request"), "CHECK_RESULT" => failure ? "1" : "0",
             "CHECK_HEAD" => (wrong_head ? "c" : "a") * 40, "START_CHECKS_ATTEMPTS" => "2", "START_CHECKS_INTERVAL" => "0"}
      out, err, status = Open3.capture3(env, "bash", "-c", step.fetch("run"), chdir: ROOT)
      yield status, File.read(log), out + err
    end
  end
end
