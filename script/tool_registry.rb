# frozen_string_literal: true

module ToolRegistry
  TOOLS = {
    "messcript" => {
      class_name: "Messcript",
      description: "Mess detector for JavaScript and TypeScript"
    },
    "messfsharp" => {
      class_name: "Messfsharp",
      description: "Mess detector for F#"
    },
    "messgo" => {
      class_name: "Messgo",
      description: "PHP Mess Detector port for Go"
    },
    "messharp" => {
      class_name: "Messharp",
      description: "Mess detector for C#"
    },
    "messpy" => {
      class_name: "Messpy",
      description: "Mess detector for Python"
    },
    "messrust" => {
      class_name: "Messrust",
      description: "Mess detector for Rust"
    },
    "mutago" => {
      class_name: "Mutago",
      description: "Mutation testing for Go"
    },
    "mutarust" => {
      class_name: "Mutarust",
      description: "Mutation testing for Rust"
    }
  }.freeze
  ANCILLARY_ASSETS = {
    "messfsharp" => ["SHA256SUMS", "messfsharp.%{version}.nupkg"]
  }.freeze
  PENDING_INITIAL_PUBLICATION = %w[mutago].freeze

  module_function

  def names
    TOOLS.keys.sort
  end

  def pending_initial_publication(directory = nil)
    return PENDING_INITIAL_PUBLICATION if directory.nil?

    PENDING_INITIAL_PUBLICATION.reject do |tool|
      File.exist?(File.join(directory, "#{tool}.rb"))
    end
  end

  def fetch(tool)
    TOOLS.fetch(tool) { raise ArgumentError, "unsupported tool: #{tool}" }
  end

  def archive_names(tool, version)
    fetch(tool)
    %W[
      #{tool}_#{version}_darwin_amd64.tar.gz
      #{tool}_#{version}_darwin_arm64.tar.gz
    ]
  end

  def release_asset_names(tool, version)
    ancillary = ANCILLARY_ASSETS.fetch(tool, []).map { |name| format(name, version: version) }
    (archive_names(tool, version) + ["checksums.txt"] + ancillary).sort
  end
end

if $PROGRAM_NAME == __FILE__
  command, *arguments = ARGV

  valid_arity = { "list" => 0, "validate" => 1, "archives" => 2, "release-assets" => 2 }
  usage = "usage: #{$PROGRAM_NAME} <list|validate TOOL|archives TOOL VERSION|release-assets TOOL VERSION>"
  abort usage unless valid_arity[command] == arguments.length

  case command
  when "list"
    puts ToolRegistry.names
  when "validate"
    ToolRegistry.fetch(arguments.fetch(0))
  when "archives"
    puts ToolRegistry.archive_names(*arguments)
  when "release-assets"
    puts ToolRegistry.release_asset_names(*arguments)
  end
end
