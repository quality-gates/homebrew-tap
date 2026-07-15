# frozen_string_literal: true

require "minitest/autorun"
load File.expand_path("../script/render-messgo-formula", __dir__)

class RenderMessgoFormulaTest < Minitest::Test
  ARM64_SHA = "a" * 64
  AMD64_SHA = "b" * 64

  def test_renders_both_immutable_release_archives
    formula = MessgoFormula.render("1.2.3", ARM64_SHA, AMD64_SHA)

    assert_includes formula, 'version "1.2.3"'
    assert_includes formula, "messgo_1.2.3_darwin_arm64.tar.gz"
    assert_includes formula, "messgo_1.2.3_darwin_amd64.tar.gz"
    assert_includes formula, %(sha256 "#{ARM64_SHA}")
    assert_includes formula, %(sha256 "#{AMD64_SHA}")
    assert_includes formula, 'bin.install "messgo"'
  end

  def test_rejects_prerelease_versions
    error = assert_raises(ArgumentError) do
      MessgoFormula.render("1.2.3-rc.1", ARM64_SHA, AMD64_SHA)
    end

    assert_equal "invalid stable semantic version", error.message
  end

  def test_rejects_unverified_checksums
    error = assert_raises(ArgumentError) do
      MessgoFormula.render("1.2.3", "not-a-checksum", AMD64_SHA)
    end

    assert_equal "invalid arm64 SHA-256", error.message
  end
end
