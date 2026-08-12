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

  def test_resumes_a_draft_interrupted_after_the_nuget_package_upload
    Dir.mktmpdir do |directory|
      work = File.join(directory, "work")
      dist = File.join(work, "dist")
      FileUtils.mkdir_p(dist)
      tool = "messfsharp"
      version = "1.2.3"
      package_name = "messfsharp.1.2.3.nupkg"
      candidate = File.join(dist, package_name)
      existing = File.join(directory, package_name)
      create_nuget_package(candidate, "candidate-metadata")
      create_nuget_package(existing, "existing-metadata")
      create_release_archives(dist, tool, version)
      File.write(File.join(dist, "SHA256SUMS"), "candidate checksum\n")

      fake_bin = File.join(directory, "bin")
      FileUtils.mkdir(fake_bin)
      fake_gh = File.join(fake_bin, "gh")
      log = File.join(directory, "gh.log")
      File.write(fake_gh, <<~'BASH')
        #!/usr/bin/env bash
        set -euo pipefail
        printf '%s\n' "$*" >> "$GH_LOG"
        if [[ "$1" == api && "$*" == *'/git/ref/tags/'* ]]; then
          printf '{"object":{"type":"commit","sha":"%s"}}\n' "$SOURCE_SHA"
        elif [[ "$1" == api && "$*" == *'/releases/42'* && "$*" == *'--jq .immutable'* ]]; then
          echo true
        elif [[ "$1" == api && "$*" == *'/releases/42'* && "$*" == *'--jq [.assets'* ]]; then
          printf '%s\n' SHA256SUMS checksums.txt \
            messfsharp.1.2.3.nupkg \
            messfsharp_1.2.3_darwin_amd64.tar.gz \
            messfsharp_1.2.3_darwin_arm64.tar.gz
        elif [[ "$1" == api && "$*" == *'/releases/42'* ]]; then
          printf '{"tag_name":"v1.2.3","prerelease":false,"assets":[{"name":"messfsharp.1.2.3.nupkg"}]}\n'
        elif [[ "$1" == release && "$2" == view ]]; then
          printf '{"databaseId":42,"isDraft":true}\n'
        elif [[ "$1" == release && "$2" == download ]]; then
          destination=""
          while [[ $# -gt 0 ]]; do
            [[ "$1" == --dir ]] && destination="$2"
            shift
          done
          mkdir -p "$destination"
          cp "$EXISTING_PACKAGE" "$destination/$(basename "$EXISTING_PACKAGE")"
        elif [[ "$1" == release && "$2" =~ ^(upload|edit|verify|verify-asset)$ ]]; then
          exit 0
        else
          echo "unexpected gh call: $*" >&2
          exit 1
        fi
      BASH
      FileUtils.chmod(0o755, fake_gh)
      output = File.join(directory, "output")
      summary = File.join(directory, "summary")
      source_sha = "a" * 40
      environment = {
        "PATH" => "#{fake_bin}:#{ENV.fetch("PATH")}",
        "GH_LOG" => log,
        "EXISTING_PACKAGE" => existing,
        "SOURCE_SHA" => source_sha,
        "GITHUB_REPOSITORY" => "quality-gates/messfsharp",
        "GITHUB_OUTPUT" => output,
        "GITHUB_STEP_SUMMARY" => summary,
        "GITHUB_SERVER_URL" => "https://github.com"
      }

      _stdout, stderr, status = Open3.capture3(
        environment,
        File.join(ACTION_DIRECTORY, "publish"),
        tool, "v1.2.3", version, source_sha, "false", "#{package_name}\nSHA256SUMS",
        chdir: work
      )

      assert status.success?, stderr
      assert_equal File.binread(existing), File.binread(candidate)
      expected_checksum = "#{Digest::SHA256.file(existing).hexdigest}  #{package_name}\n"
      assert_equal expected_checksum, File.read(File.join(dist, "SHA256SUMS"))
      assert_match %r{release upload v1\.2\.3 .*/dist/SHA256SUMS}, File.read(log)
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
      create_release_archives(directory, tool, version)
      yield directory
    end
  end

  def create_release_archives(directory, tool, version)
    archives = %W[
      #{tool}_#{version}_darwin_amd64.tar.gz
      #{tool}_#{version}_darwin_arm64.tar.gz
    ]
    archives.each { |archive| File.write(File.join(directory, archive), archive) }
    checksums = archives.map do |archive|
      "#{Digest::SHA256.file(File.join(directory, archive)).hexdigest}  #{archive}"
    end
    File.write(File.join(directory, "checksums.txt"), "#{checksums.join("\n")}\n")
  end

  def create_nuget_package(package, metadata)
    Dir.mktmpdir do |source|
      FileUtils.mkdir_p(File.join(source, "lib", "net10.0"))
      FileUtils.mkdir_p(File.join(source, "package", "services", "metadata", "core-properties"))
      File.write(File.join(source, "lib", "net10.0", "messfsharp.dll"), "stable payload")
      File.write(File.join(source, "package", "services", "metadata", "core-properties", "metadata.psmdcp"), metadata)
      system("zip", "-q", "-r", package, ".", chdir: source) || raise("zip failed")
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
