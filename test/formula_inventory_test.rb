# frozen_string_literal: true

require "fileutils"
require "minitest/autorun"
require "tmpdir"
require_relative "../script/formula_inventory"

class FormulaInventoryTest < Minitest::Test
  def test_accepts_exactly_one_formula_for_each_registered_tool
    Dir.mktmpdir do |directory|
      ToolRegistry.names.each { |tool| FileUtils.touch(File.join(directory, "#{tool}.rb")) }

      FormulaInventory.verify!(directory)
    end
  end

  def test_accepts_inventory_with_pending_initial_publication
    Dir.mktmpdir do |directory|
      (ToolRegistry.names - ToolRegistry.pending_initial_publication).each do |tool|
        FileUtils.touch(File.join(directory, "#{tool}.rb"))
      end

      FormulaInventory.verify!(directory)
    end
  end

  def test_rejects_a_missing_formula
    Dir.mktmpdir do |directory|
      (ToolRegistry.names - ["messrust"]).each do |tool|
        FileUtils.touch(File.join(directory, "#{tool}.rb"))
      end

      error = assert_raises(FormulaInventory::Mismatch) do
        FormulaInventory.verify!(directory)
      end
      assert_includes error.message, "missing: messrust"
    end
  end

  def test_rejects_an_unregistered_formula
    Dir.mktmpdir do |directory|
      ToolRegistry.names.each { |tool| FileUtils.touch(File.join(directory, "#{tool}.rb")) }
      FileUtils.touch(File.join(directory, "other.rb"))

      error = assert_raises(FormulaInventory::Mismatch) do
        FormulaInventory.verify!(directory)
      end
      assert_includes error.message, "unexpected: other"
    end
  end
end
