# frozen_string_literal: true

require "minitest/autorun"
require "tmpdir"
load File.expand_path("../script/render-formula", __dir__)

class RenderFormulaTest < Minitest::Test
  ARM64_SHA = "a" * 64
  AMD64_SHA = "b" * 64
  TOOLS = %w[messcript messfsharp messgo messharp messpy messrust].freeze

  def test_renders_every_mess_tool_from_immutable_release_archives
    TOOLS.each do |tool|
      formula = MessFormula.render(tool, "1.2.3", ARM64_SHA, AMD64_SHA)

      assert_includes formula, %(class #{MessFormula::TOOLS.fetch(tool).fetch(:class_name)} < Formula)
      assert_includes formula, %(version "1.2.3")
      assert_includes formula, "#{tool}_1.2.3_darwin_arm64.tar.gz"
      assert_includes formula, "#{tool}_1.2.3_darwin_amd64.tar.gz"
      assert_includes formula, %(sha256 "#{ARM64_SHA}")
      assert_includes formula, %(sha256 "#{AMD64_SHA}")
      assert_includes formula, %(bin.install "#{tool}")
      assert_includes formula, %(shell_output("\#{bin}/#{tool} --version"))
    end
  end

  def test_cli_creates_the_formula_directory_for_a_first_publication
    Dir.mktmpdir do |directory|
      output = File.join(directory, "Formula", "messpy.rb")
      command = File.expand_path("../script/render-formula", __dir__)

      assert system(command, "messpy", "1.2.3", ARM64_SHA, AMD64_SHA, output)
      assert File.file?(output)
      assert_includes File.read(output), "class Messpy < Formula"
    end
  end

  def test_rejects_unknown_tools
    error = assert_raises(ArgumentError) do
      MessFormula.render("other", "1.2.3", ARM64_SHA, AMD64_SHA)
    end

    assert_equal "unsupported tool: other", error.message
  end

  def test_rejects_prerelease_versions
    error = assert_raises(ArgumentError) do
      MessFormula.render("messgo", "1.2.3-rc.1", ARM64_SHA, AMD64_SHA)
    end

    assert_equal "invalid stable semantic version", error.message
  end

  def test_rejects_unverified_checksums
    error = assert_raises(ArgumentError) do
      MessFormula.render("messgo", "1.2.3", "not-a-checksum", AMD64_SHA)
    end

    assert_equal "invalid arm64 SHA-256", error.message
  end
end
