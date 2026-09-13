# frozen_string_literal: true
require "minitest/autorun"
require "open3"
require "tmpdir"
require "fileutils"
require "yaml"

class AuditRetryTest < Minitest::Test
  ROOT = File.expand_path("..", __dir__)

  def test_workflow_recovers_from_a_transient_release_url_failure
    run_audit("HTTP status code 500", failures: 1) do |status, attempts, output|
      assert status.success?, output
      assert_equal 2, attempts
    end
  end

  def test_workflow_recovers_from_a_temporary_homepage_failure
    run_audit("The homepage URL https://github.com/quality-gates/messcript is not reachable", failures: 1) do |status, attempts, output|
      assert status.success?, output
      assert_equal 2, attempts
    end
  end

  def test_workflow_rejects_a_permanent_audit_error_without_retry
    run_audit("Stable: version is redundant", failures: 1) do |status, attempts, _output|
      refute status.success?
      assert_equal 1, attempts
    end
  end

  def test_workflow_stops_after_repeated_network_failure
    run_audit("HTTP status code 500", failures: 10) do |status, attempts, _output|
      refute status.success?
      assert_equal 3, attempts
    end
  end

  private

  def run_audit(message, failures:)
    workflow = YAML.load_file(File.join(ROOT, ".github/workflows/test.yml"))
    step = workflow.fetch("jobs").fetch("install").fetch("steps").find { |s| s["name"] == "Audit, install, and test formulas" }
    Dir.mktmpdir do |dir|
      FileUtils.cp_r(File.join(ROOT, "script"), dir)
      FileUtils.mkdir_p(File.join(dir, "Formula"))
      FileUtils.cp(File.join(ROOT, "Formula/messcript.rb"), File.join(dir, "Formula/messcript.rb"))
      File.write(File.join(dir, "brew"), <<~'SH')
        #!/usr/bin/env bash
        if [[ "$1" == audit ]]; then
          count=$(cat "$AUDIT_STATE" 2>/dev/null || echo 0)
          count=$((count + 1))
          echo "$count" > "$AUDIT_STATE"
          if ((count <= AUDIT_FAILURES)); then
            echo "$AUDIT_MESSAGE" >&2
            exit 1
          fi
        fi
      SH
      File.write(File.join(dir, "messcript"), "#!/usr/bin/env bash\nscript/formula-version Formula/messcript.rb\n")
      FileUtils.chmod(0o755, [File.join(dir, "brew"), File.join(dir, "messcript")])
      env = {"PATH" => "#{dir}:#{ENV.fetch('PATH')}", "AUDIT_STATE" => File.join(dir, "count"),
             "AUDIT_MESSAGE" => message, "AUDIT_FAILURES" => failures.to_s, "NETWORK_RETRY_INTERVAL" => "0"}
      out, err, status = Open3.capture3(env, "bash", "-c", step.fetch("run"), chdir: dir)
      yield status, File.read(File.join(dir, "count")).to_i, out + err
    end
  end
end
