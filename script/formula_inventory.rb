# frozen_string_literal: true

require_relative "tool_registry"

module FormulaInventory
  class Mismatch < StandardError; end

  module_function

  def verify!(directory)
    actual = Dir[File.join(directory, "*.rb")].map { |path| File.basename(path, ".rb") }.sort
    expected = ToolRegistry.names - ToolRegistry.pending_initial_publication(directory)
    missing = expected - actual
    unexpected = actual - ToolRegistry.names
    return if missing.empty? && unexpected.empty?

    details = []
    details << "missing: #{missing.join(", ")}" unless missing.empty?
    details << "unexpected: #{unexpected.join(", ")}" unless unexpected.empty?
    raise Mismatch, "formula inventory mismatch (#{details.join("; ")})"
  end
end

if $PROGRAM_NAME == __FILE__
  abort "usage: #{$PROGRAM_NAME} FORMULA_DIRECTORY" unless ARGV.length == 1

  FormulaInventory.verify!(ARGV.fetch(0))
end
