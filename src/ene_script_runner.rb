require "extensions.rb"

# Eneroth Extensions
module Eneroth
  # Eneroth Script Runner
  module ScriptRunner
    path = __FILE__
    path.force_encoding("UTF-8") if path.respond_to?(:force_encoding)

    # Identifier for this extension.
    PLUGIN_ID = File.basename(path, ".*")

    # Root directory of this extension.
    PLUGIN_ROOT = File.join(File.dirname(path), PLUGIN_ID)

    # Extension object for this extension.
    EXTENSION = SketchupExtension.new(
      "Eneroth Script Runner",
      File.join(PLUGIN_ROOT, "main")
    )

    EXTENSION.creator     = "Eneroth"
    EXTENSION.description = "Run Ruby script by dropping it in SketchUp."
    EXTENSION.version     = "1.0.0"
    EXTENSION.copyright   = "2020, #{EXTENSION.creator}"
    Sketchup.register_extension(EXTENSION, true)
  end
end
