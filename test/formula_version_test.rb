# frozen_string_literal: true

require "minitest/autorun"
load File.expand_path("../script/formula-version", __dir__)

class FormulaVersionTest < Minitest::Test
  def test_extracts_the_shared_version_from_release_urls
    formula = <<~RUBY
      url "https://github.com/quality-gates/messgo/releases/download/v1.2.3/messgo_1.2.3_darwin_arm64.tar.gz"
      url "https://github.com/quality-gates/messgo/releases/download/v1.2.3/messgo_1.2.3_darwin_amd64.tar.gz"
    RUBY

    assert_equal "1.2.3", FormulaVersion.extract(formula)
  end

  def test_rejects_formulas_without_a_stable_release_url
    error = assert_raises(ArgumentError) { FormulaVersion.extract("url \"https://example.com/tool.tar.gz\"") }

    assert_equal "formula must reference exactly one stable release version", error.message
  end

  def test_rejects_mixed_release_versions
    formula = <<~RUBY
      url "https://github.com/quality-gates/messgo/releases/download/v1.2.3/arm64.tar.gz"
      url "https://github.com/quality-gates/messgo/releases/download/v1.2.4/amd64.tar.gz"
    RUBY

    error = assert_raises(ArgumentError) { FormulaVersion.extract(formula) }

    assert_equal "formula must reference exactly one stable release version", error.message
  end
end
