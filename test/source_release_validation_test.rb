# frozen_string_literal: true

require "fileutils"
require "minitest/autorun"
require "open3"
require "tmpdir"

class SourceReleaseValidationTest < Minitest::Test
  SCRIPT = File.expand_path("../.github/actions/validate-source-release/validate", __dir__)

  def test_resolves_an_annotated_tag_to_an_immutable_release_commit
    with_fake_github(final_type: "commit") do |environment, output, source_sha|
      _stdout, stderr, status = Open3.capture3(
        environment,
        SCRIPT,
        "messgo", "v1.2.3", "push", "tag", source_sha
      )

      assert status.success?, stderr
      assert_equal(
        ["version=1.2.3", "source_sha=#{source_sha}", "immutable_release=true"],
        File.readlines(output, chomp: true)
      )
    end
  end

  def test_rejects_a_tag_that_does_not_resolve_to_a_commit
    with_fake_github(final_type: "blob") do |environment, _output, source_sha|
      _stdout, stderr, status = Open3.capture3(
        environment,
        SCRIPT,
        "messgo", "v1.2.3", "workflow_dispatch", "branch", source_sha
      )

      refute status.success?
      assert_includes stderr, "does not resolve to a commit"
    end
  end

  private

  def with_fake_github(final_type:)
    Dir.mktmpdir do |directory|
      source_sha = "a" * 40
      tag_sha = "b" * 40
      fake_gh = File.join(directory, "gh")
      File.write(fake_gh, <<~BASH)
        #!/usr/bin/env bash
        set -euo pipefail
        if [[ "$*" == *'/git/ref/tags/v1.2.3'* ]]; then
          printf '{"object":{"type":"tag","sha":"#{tag_sha}"}}\\n'
        elif [[ "$*" == *'/git/tags/#{tag_sha}'* ]]; then
          printf '{"object":{"type":"#{final_type}","sha":"#{source_sha}"}}\\n'
        elif [[ "$*" == *'/releases/tags/v1.2.3'* ]]; then
          printf '{"draft":false,"prerelease":false,"immutable":true}\\n'
        else
          exit 1
        fi
      BASH
      FileUtils.chmod(0o755, fake_gh)
      output = File.join(directory, "output")
      environment = {
        "PATH" => "#{directory}:#{ENV.fetch("PATH")}",
        "GH_TOKEN" => "token",
        "GITHUB_REPOSITORY" => "quality-gates/messgo",
        "GITHUB_OUTPUT" => output
      }
      yield environment, output, source_sha
    end
  end
end
