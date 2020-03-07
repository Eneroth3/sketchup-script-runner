module Eneroth
  module ScriptRunner
    # SketchUp importer interface for RB files.
    #
    # Has the side effect of listing as an importer in File > Import, even if
    # that doesn't make much sense as you don't "import" an RB.
    # Ideally this should listen to RBZ files being dropped without being listed
    # as an importer.
    class Importer < Sketchup::Importer
      # @api
      # @see http://ruby.sketchup.com/Sketchup/Importer.html
      def description
        "Ruby Script (*.rb)"
      end

      # @api
      # @see http://ruby.sketchup.com/Sketchup/Importer.html
      def file_extension
        "rb"
      end

      # @api
      # @see http://ruby.sketchup.com/Sketchup/Importer.html
      def id
        self.class.name
      end

      # @api
      # @see http://ruby.sketchup.com/Sketchup/Importer.html
      def support_options
        false
      end

      # @api
      # @see http://ruby.sketchup.com/Sketchup/Importer.htmlS
      def load_file(path, _status)
        load(path)
        puts "load '#{path}'"

        ImportSuccess
      end
    end

    unless @loaded
      @loaded = true
      Sketchup.register_importer(Importer.new)
    end
  end
end
