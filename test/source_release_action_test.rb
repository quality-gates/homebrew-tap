# frozen_string_literal: true

require "digest"
require "fileutils"
require "minitest/autorun"
require "open3"
require "tmpdir"

class SourceReleaseActionTest < Minitest::Test
  SCRIPT = File.expand_path("../.github/actions/publish-source-release/verify-assets", __dir__)

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
