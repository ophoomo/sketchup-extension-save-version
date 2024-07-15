
Sketchup.require File.join(File.dirname(__FILE__), 'main')

module THANAPHOOM::SaveVersion
  file = __FILE__

  unless file_loaded? file

      extensions_menu = UI.menu('Extensions')

      extensions_menu.add_item("Save Version") {main}

      file_loaded file
	  
	  UI.add_context_menu_handler do |context_menu|
		context_menu.add_item("Save Version") {main}
	  end
	  
  end
end
