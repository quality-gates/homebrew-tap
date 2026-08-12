# frozen_string_literal: true

require "digest"
require "fileutils"
require "minitest/autorun"
require "open3"
require "tmpdir"

class SourceReleaseActionTest < Minitest::Test
  ACTION_DIRECTORY = File.expand_path("../.github/actions/publish-source-release", __dir__)
  SCRIPT = File.join(ACTION_DIRECTORY, "verify-assets")

  def test_accepts_the_two_archives_and_checksum_manifest
    with_release_assets("messgo", "1.2.3") do |directory|
      assert_contract directory, "messgo", "1.2.3"
    end
  end

  def test_accepts_declared_ancillary_assets_without_adding_them_to_homebrew_checksums
    with_release_assets("messfsharp", "1.2.3") do |directory|
      File.write(File.join(directory, "messfsharp.1.2.3.nupkg"), "package")
      File.write(File.join(directory, "SHA256SUMS"), "nuget checksum\n")

      assert_contract directory, "messfsharp", "1.2.3", "messfsharp.1.2.3.nupkg\nSHA256SUMS"
    end
  end

  def test_rejects_an_undeclared_asset
    with_release_assets("messgo", "1.2.3") do |directory|
      File.write(File.join(directory, "other.txt"), "unexpected")

      refute_contract directory, "messgo", "1.2.3", error: "unexpected release asset set"
    end
  end

  def test_uploads_a_nuget_package_before_its_checksum
    stdout, stderr, status = Open3.capture3(
      File.join(ACTION_DIRECTORY, "asset-order"),
      "messfsharp", "1.2.3", "messfsharp.1.2.3.nupkg\nSHA256SUMS"
    )

    assert status.success?, stderr
    assets = stdout.lines(chomp: true)
    assert_operator assets.index("messfsharp.1.2.3.nupkg"), :<, assets.index("SHA256SUMS")
  end

  def test_dispatch_correlates_the_standard_empty_response_with_the_created_run
    Dir.mktmpdir do |directory|
      fake_gh = File.join(directory, "gh")
      log = File.join(directory, "gh.log")
      request = File.join(directory, "request-id")
      summary = File.join(directory, "summary")
      File.write(fake_gh, <<~BASH)
        #!/usr/bin/env bash
        set -euo pipefail
        printf '%s\\n' "$*" >> "$GH_LOG"
        if [[ "$*" == *'/git/ref/heads/main'* ]]; then
          printf '%040d\\n' 1
        elif [[ "$*" == *'/dispatches'* ]]; then
          for argument in "$@"; do
            [[ "$argument" == "inputs[request_id]="* ]] && printf '%s\\n' "${argument#*=}" > "$REQUEST_FILE"
          done
        elif [[ "$*" == *'/runs'* ]]; then
          request_id="$(cat "$REQUEST_FILE")"
          printf '{"workflow_runs":[{"id":123,"display_title":"Publish messgo v1.2.3 %s","head_sha":"%040d","html_url":"https://github.com/quality-gates/homebrew-tap/actions/runs/123"}]}\\n' "$request_id" 1
        elif [[ "$1" == run && "$2" == watch ]]; then
          exit 0
        else
          exit 1
        fi
      BASH
      FileUtils.chmod(0o755, fake_gh)
      environment = {
        "PATH" => "#{directory}:#{ENV.fetch("PATH")}",
        "GH_LOG" => log,
        "REQUEST_FILE" => request,
        "GITHUB_STEP_SUMMARY" => summary
      }

      _stdout, stderr, status = Open3.capture3(
        environment,
        File.join(ACTION_DIRECTORY, "dispatch"),
        "messgo", "v1.2.3", "42", "a" * 40
      )

      assert status.success?, stderr
      calls = File.read(log)
      assert_includes calls, "--method POST"
      refute_includes calls, "return_run_details"
      assert_includes calls, "run watch 123"
    end
  end

  def test_rejects_an_ancillary_asset_in_the_homebrew_manifest
    with_release_assets("messfsharp", "1.2.3") do |directory|
      package = File.join(directory, "messfsharp.1.2.3.nupkg")
      File.write(package, "package")
      File.open(File.join(directory, "checksums.txt"), "a") do |manifest|
        manifest.puts "#{Digest::SHA256.file(package).hexdigest}  messfsharp.1.2.3.nupkg"
      end

      refute_contract directory, "messfsharp", "1.2.3", "messfsharp.1.2.3.nupkg", error: "unexpected Homebrew checksum manifest"
    end
  end

  private

  def with_release_assets(tool, version)
    Dir.mktmpdir do |directory|
      archives = %W[
        #{tool}_#{version}_darwin_amd64.tar.gz
        #{tool}_#{version}_darwin_arm64.tar.gz
      ]
      archives.each { |archive| File.write(File.join(directory, archive), archive) }
      checksums = archives.map do |archive|
        "#{Digest::SHA256.file(File.join(directory, archive)).hexdigest}  #{archive}"
      end
      File.write(File.join(directory, "checksums.txt"), "#{checksums.join("\n")}\n")
      yield directory
    end
  end

  def assert_contract(directory, tool, version, extra_assets = "")
    stdout, stderr, status = Open3.capture3(SCRIPT, tool, version, directory, extra_assets)

    assert status.success?, "#{stdout}\n#{stderr}"
  end

  def refute_contract(directory, tool, version, extra_assets = "", error:)
    _stdout, stderr, status = Open3.capture3(SCRIPT, tool, version, directory, extra_assets)

    refute status.success?
    assert_includes stderr, error
  end
end
