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
    }
  }.freeze

  module_function

  def names
    TOOLS.keys.sort
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
end

if $PROGRAM_NAME == __FILE__
  command, *arguments = ARGV

  valid_arity = { "list" => 0, "validate" => 1, "archives" => 2 }
  abort "usage: #{$PROGRAM_NAME} <list|validate TOOL|archives TOOL VERSION>" unless valid_arity[command] == arguments.length

  case command
  when "list"
    puts ToolRegistry.names
  when "validate"
    ToolRegistry.fetch(arguments.fetch(0))
  when "archives"
    puts ToolRegistry.archive_names(*arguments)
  end
end
