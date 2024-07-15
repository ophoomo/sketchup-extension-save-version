require 'sketchup.rb'
require 'extensions.rb'

module THANAPHOOM
  module SaveVersion
    PLUGIN_NAME = 'SaveVersion'.freeze
    PLUGIN_VERSION = '1.0.0'.freeze
    unless file_loaded?(__FILE__)
      extension = SketchupExtension.new(PLUGIN_NAME, 'tp_save_version/loader')
      extension.version = PLUGIN_VERSION
      extension.copyright = 'Copyright 2024 SaveVersion All Rights Reserved'
      extension.creator = 'THANAPHOOM AUNCHIT'
      extension.description = "THANAPHOOM"
      Sketchup.register_extension(extension, true)
    end
  end
end
file_loaded(__FILE__)