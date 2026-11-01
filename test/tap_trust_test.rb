# frozen_string_literal: true

require "fileutils"
require "minitest/autorun"
require "open3"
require "tmpdir"
require "yaml"

class TapTrustTest < Minitest::Test
  ROOT = File.expand_path("..", __dir__)

  def test_install_and_upgrade_trust_the_candidate_before_loading_formulas
    %w[install upgrade].each do |job|
      run_workflow(job) do |status, calls, output|
        assert status.success?, "#{job}: #{output}"
        assert_includes calls, "trust quality-gates/tap\n"
        assert_includes calls, "install quality-gates/tap/messcript\n"
        if job == "install"
          assert_includes calls, "audit --strict --online quality-gates/tap/messcript\n"
          assert_includes calls, "style quality-gates/tap/messcript\n"
          assert_includes calls, "test quality-gates/tap/messcript\n"
        else
          assert_includes calls, "upgrade quality-gates/tap/messcript\n"
        end
      end
    end
  end

  def test_install_and_upgrade_support_homebrew_without_the_trust_command
    %w[install upgrade].each do |job|
      run_workflow(job, supports_trust: false) do |status, calls, output|
        assert status.success?, "#{job}: #{output}"
        refute_match(/^trust /, calls)
        assert_includes calls, "install quality-gates/tap/messcript\n"
        assert_includes calls, "upgrade quality-gates/tap/messcript\n" if job == "upgrade"
      end
    end
  end

  def test_install_and_upgrade_stop_when_trust_fails
    %w[install upgrade].each do |job|
      run_workflow(job, trust_fails: true) do |status, calls, output|
        refute status.success?, "#{job}: #{output}"
        assert_includes calls, "trust quality-gates/tap\n"
        refute_match(/^(audit|style|install|test|upgrade) /, calls)
      end
    end
  end

  private

  def run_workflow(job, supports_trust: true, trust_fails: false)
    workflow = YAML.load_file(File.join(ROOT, ".github/workflows/test.yml"))
    steps = workflow.fetch("jobs").fetch(job).fetch("steps")
    names = if job == "install"
      ["Tap candidate repository", "Audit, install, and test formulas"]
    else
      ["Install predecessor and upgrade to candidate"]
    end
    machine, = Open3.capture2("uname", "-m")
    commands = names.map do |name|
      steps.find { |step| step["name"] == name }.fetch("run").gsub("${{ matrix.machine }}", machine.strip)
    end

    Dir.mktmpdir do |directory|
      candidate = File.join(directory, "candidate")
      FileUtils.mkdir_p(File.join(candidate, "Formula"))
      FileUtils.mkdir_p(File.join(candidate, "script"))
      %w[formula-version retry-network].each do |script|
        FileUtils.cp(File.join(ROOT, "script", script), File.join(candidate, "script", script))
      end
      formula = File.join(candidate, "Formula/messcript.rb")
      contents = File.read(File.join(ROOT, "Formula/messcript.rb"))
      File.write(formula, contents)
      git(candidate, "init", "--quiet")
      git(candidate, "add", ".")
      git(candidate, "commit", "--quiet", "-m", "Predecessor")
      base = git(candidate, "rev-parse", "HEAD").strip
      version = contents.match(%r{/releases/download/v([^/]+)/})[1]
      parts = version.split(".").map(&:to_i)
      parts[-1] += 1
      File.write(formula, contents.gsub(version, parts.join(".")))
      git(candidate, "add", ".")
      git(candidate, "commit", "--quiet", "-m", "Candidate")

      File.write(File.join(directory, "brew"), <<~'SH')
        #!/usr/bin/env bash
        set -euo pipefail
        printf '%s\n' "$*" >> "$BREW_LOG"
        case "$1" in
          command) [[ "$2" == trust && "$BREW_SUPPORTS_TRUST" == true ]] ;;
          tap) git clone --quiet "$3" "$TAP_DIRECTORY" ;;
          trust)
            [[ "$2" == quality-gates/tap && "$BREW_TRUST_FAILS" == false ]]
            touch "$TRUST_STATE"
            ;;
          --repo) printf '%s\n' "$TAP_DIRECTORY" ;;
          audit|style|install|test|upgrade)
            if [[ "$BREW_SUPPORTS_TRUST" == true && ! -f "$TRUST_STATE" ]]; then
              echo "Refusing to load formula quality-gates/tap/messcript from untrusted tap quality-gates/tap." >&2
              exit 1
            fi
            ;;
          *) exit 1 ;;
        esac
      SH
      File.write(File.join(directory, "messcript"), <<~'SH')
        #!/usr/bin/env bash
        exec "$GITHUB_WORKSPACE/script/formula-version" "$TAP_DIRECTORY/Formula/messcript.rb"
      SH
      FileUtils.chmod(0o755, [File.join(directory, "brew"), File.join(directory, "messcript")])
      log = File.join(directory, "brew.log")
      environment = {
        "PATH" => "#{directory}:#{ENV.fetch("PATH")}",
        "BASE_SHA" => base,
        "GITHUB_WORKSPACE" => candidate,
        "RUNNER_TEMP" => directory,
        "GITHUB_STEP_SUMMARY" => File.join(directory, "summary"),
        "TAP_DIRECTORY" => File.join(directory, "tap"),
        "BREW_LOG" => log,
        "TRUST_STATE" => File.join(directory, "trusted"),
        "BREW_SUPPORTS_TRUST" => supports_trust.to_s,
        "BREW_TRUST_FAILS" => trust_fails.to_s
      }
      stdout, stderr, status = Open3.capture3(environment, "bash", "-e", "-o", "pipefail", "-c", commands.join("\n"), chdir: candidate)
      yield status, File.read(log), stdout + stderr
    end
  end

  def git(directory, *arguments)
    stdout, stderr, status = Open3.capture3(
      "git", "-c", "user.name=Tap trust test", "-c", "user.email=tap-trust@example.invalid", "-C", directory, *arguments
    )
    raise stderr unless status.success?

    stdout
  end
end
