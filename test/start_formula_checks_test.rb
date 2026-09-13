# frozen_string_literal: true
require "minitest/autorun"
require "open3"
require "tmpdir"
require "fileutils"
require "yaml"

class StartFormulaChecksTest < Minitest::Test
  ROOT = File.expand_path("..", __dir__)

  def test_publisher_approves_its_generated_pr_checks
    run_checks do |status, log, output|
      assert status.success?, output
      assert_includes log, "api --method POST repos/{owner}/{repo}/actions/runs/123/approve"
      assert_includes log, "run watch 123 --exit-status"
      refute_includes log, "runs/999/approve"
    end
  end

  def test_publisher_propagates_test_failure
    run_checks(failure: true) { |status, _log, _output| refute status.success? }
  end

  def test_publisher_does_not_approve_a_different_commit
    run_checks(wrong_head: true) do |status, log, output|
      refute status.success?
      refute_includes log, "api --method POST"
      assert_includes output, "No formula test run"
    end
  end

  def test_publisher_does_not_approve_an_untrusted_pr
    run_checks(fork: true) do |status, log, _output|
      refute status.success?
      refute_includes log, "run list"
    end
  end

  private

  def run_checks(failure: false, wrong_head: false, fork: false)
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
          printf '{"state":"OPEN","headRefName":"automation/messpy-v0.1.13","headRefOid":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa","author":{"login":"app/github-actions"},"isCrossRepository":%s}\n' "$IS_FORK"
        elif [[ "$1 $2" == 'run list' ]]; then
          conclusion=action_required
          [[ ! -f "$GH_APPROVED" ]] || conclusion=''
          printf '[{"databaseId":999,"headSha":"cccccccccccccccccccccccccccccccccccccccc","conclusion":"action_required"},{"databaseId":123,"headSha":"%s","conclusion":"%s"}]\n' "$CHECK_HEAD" "$conclusion"
        elif [[ "$1 $2" == 'api --method' && "$4" == 'repos/{owner}/{repo}/actions/runs/123/approve' ]]; then
          touch "$GH_APPROVED"
        elif [[ "$1 $2" == 'run watch' && -f "$GH_APPROVED" ]]; then
          exit "$CHECK_RESULT"
        else
          echo "Unexpected gh call" >&2
          exit 1
        fi
      SH
      FileUtils.chmod(0o755, fake)
      log = File.join(dir, "log")
      env = {"PATH" => "#{dir}:#{ENV.fetch('PATH')}", "PR_URL" => "https://github.com/quality-gates/homebrew-tap/pull/75",
             "GH_LOG" => log, "GH_APPROVED" => File.join(dir, "approved"), "CHECK_RESULT" => failure ? "1" : "0",
             "IS_FORK" => fork ? "true" : "false", "CHECK_HEAD" => (wrong_head ? "c" : "a") * 40,
             "START_CHECKS_ATTEMPTS" => "2", "START_CHECKS_INTERVAL" => "0"}
      out, err, status = Open3.capture3(env, "bash", "-c", step.fetch("run"), chdir: ROOT)
      yield status, File.read(log), out + err
    end
  end
end
