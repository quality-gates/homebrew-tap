# frozen_string_literal: true

require "minitest/autorun"
require_relative "../script/tool_registry"

class ToolRegistryTest < Minitest::Test
  EXPECTED_TOOLS = %w[messcript messfsharp messgo messharp messpy messrust mutago].freeze

  def test_lists_the_supported_formula_inventory
    assert_equal EXPECTED_TOOLS, ToolRegistry.names
  end

  def test_records_mutago_metadata
    assert_equal(
      { class_name: "Mutago", description: "Mutation testing for Go" },
      ToolRegistry.fetch("mutago")
    )
  end

  def test_identifies_tools_pending_initial_publication
    assert_includes ToolRegistry.pending_initial_publication, "mutago"
  end

  def test_derives_homebrew_release_assets
    assert_equal(
      %w[
        messgo_1.2.3_darwin_amd64.tar.gz
        messgo_1.2.3_darwin_arm64.tar.gz
      ],
      ToolRegistry.archive_names("messgo", "1.2.3")
    )
  end

  def test_declares_the_complete_fsharp_release_contract
    assert_equal(
      %w[
        SHA256SUMS
        checksums.txt
        messfsharp.1.2.3.nupkg
        messfsharp_1.2.3_darwin_amd64.tar.gz
        messfsharp_1.2.3_darwin_arm64.tar.gz
      ],
      ToolRegistry.release_asset_names("messfsharp", "1.2.3")
    )
  end

  def test_other_tools_have_no_ancillary_release_assets
    assert_equal(
      %w[
        checksums.txt
        messgo_1.2.3_darwin_amd64.tar.gz
        messgo_1.2.3_darwin_arm64.tar.gz
      ],
      ToolRegistry.release_asset_names("messgo", "1.2.3")
    )
  end

  def test_records_formula_metadata
    assert_equal(
      { class_name: "Messpy", description: "Mess detector for Python" },
      ToolRegistry.fetch("messpy")
    )
  end

  def test_rejects_unknown_tools
    error = assert_raises(ArgumentError) { ToolRegistry.fetch("other") }

    assert_equal "unsupported tool: other", error.message
  end
end
