# frozen_string_literal: true

require "digest"
require "fileutils"
require "json"
require "minitest/autorun"
require "open3"
require "tmpdir"
require "yaml"

class ReleaseAssetRetryTest < Minitest::Test
  ROOT = File.expand_path("..", __dir__)

  def test_publish_workflow_recovers_when_release_assets_appear_on_retry
    workflow = YAML.load_file(File.join(ROOT, ".github/workflows/publish-formula.yml"))
    step = workflow.fetch("jobs").fetch("update").fetch("steps").find do |candidate|
      candidate["name"] == "Verify immutable upstream release"
    end

    Dir.mktmpdir do |directory|
      FileUtils.cp_r(File.join(ROOT, "script"), directory)
      fixture = File.join(directory, "fixture")
      FileUtils.mkdir_p(fixture)
      assets = %w[messgo_0.5.0_darwin_amd64.tar.gz messgo_0.5.0_darwin_arm64.tar.gz]
      assets.each { |asset| File.write(File.join(fixture, asset), asset) }
      checksums = assets.map { |asset| "#{Digest::SHA256.file(File.join(fixture, asset)).hexdigest}  #{asset}" }
      File.write(File.join(fixture, "checksums.txt"), checksums.join("\n") + "\n")
      release = {tag_name: "v0.5.0", draft: false, prerelease: false, immutable: true,
                 assets: (assets + ["checksums.txt"]).map { |name| {name: name} }}
      File.write(File.join(directory, "release.json"), JSON.generate(release))
      File.write(File.join(directory, "ref.json"), JSON.generate(object: {type: "commit", sha: "a" * 40}))
      fake_gh = File.join(directory, "gh")
      File.write(fake_gh, <<~'BASH')
        #!/usr/bin/env bash
        set -euo pipefail
        if [[ "$1" == api && "$2" == */releases/* ]]; then
          cat "$RELEASE_JSON"
        elif [[ "$1" == api && "$2" == */git/ref/tags/* ]]; then
          cat "$REF_JSON"
        elif [[ "$1" == release && "$2" == download ]]; then
          attempt=$(cat "$ATTEMPTS" 2>/dev/null || echo 0)
          attempt=$((attempt + 1))
          echo "$attempt" > "$ATTEMPTS"
          if ((attempt == 1)); then
            echo 'no assets to download' >&2
            exit 1
          fi
          cp "$FIXTURE"/* dist/
        else
          exit 1
        fi
      BASH
      FileUtils.chmod(0o755, fake_gh)
      attempts = File.join(directory, "attempts")
      environment = {
        "PATH" => "#{directory}:#{ENV.fetch('PATH')}",
        "TOOL" => "messgo", "TAG" => "v0.5.0", "RELEASE_ID" => "394512314",
        "SOURCE_SHA" => "a" * 40, "REQUEST_ID" => "b74604b2-a08e-4175-a50d-8ae672068d1b",
        "RELEASE_JSON" => File.join(directory, "release.json"),
        "REF_JSON" => File.join(directory, "ref.json"),
        "FIXTURE" => fixture, "ATTEMPTS" => attempts,
        "GITHUB_OUTPUT" => File.join(directory, "output"), "NETWORK_RETRY_INTERVAL" => "0"
      }
      stdout, stderr, status = Open3.capture3(environment, "bash", "-c", step.fetch("run"), chdir: directory)

      assert status.success?, stdout + stderr
      assert_equal "2", File.read(attempts).strip
      assert_includes File.read(environment.fetch("GITHUB_OUTPUT")), "version=0.5.0"
    end
  end
end
