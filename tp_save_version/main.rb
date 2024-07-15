
module THANAPHOOM
  module SaveVersion
    @mod = Sketchup.active_model
    class << self
      
		def ensure_skp_extension(file_path)
		  if file_path.nil? || file_path.empty?
			raise "File path cannot be nil or empty"
		  end

		  if File.basename(file_path) == ".skp"
		    current_time = Time.now
			formatted_time1 = current_time.strftime("%Y-%m-%d-%H-%M-%S")
			return File.join(File.dirname(file_path), formatted_time1+".skp")
		  end
		  if File.extname(file_path) == ".skp"
			return file_path
		  else
			new_file_path = "#{File.basename(file_path, '.*')}.skp"
			new_file_path = File.join(File.dirname(file_path), new_file_path)
			
			return new_file_path
		  end
		end
	  
	  def check_version(version)
		case version
		  when '3'
			Sketchup::Model::VERSION_3
		  when '4'
			Sketchup::Model::VERSION_4
		  when '5'
			Sketchup::Model::VERSION_5
		  when '6'
			Sketchup::Model::VERSION_6
		  when '7'
			Sketchup::Model::VERSION_7
		  when '8'
			Sketchup::Model::VERSION_8
		  when '2013'
			Sketchup::Model::VERSION_2013
		  when '2014'
			Sketchup::Model::VERSION_2014
		  when '2015'
			Sketchup::Model::VERSION_2015
		  when '2016'
			Sketchup::Model::VERSION_2016
		  when '2017'
			Sketchup::Model::VERSION_2017
		  when '2018'
			Sketchup::Model::VERSION_2018
		  when '2019'
			Sketchup::Model::VERSION_2019
		  when '2020'
			Sketchup::Model::VERSION_2020
		  when '2021'
			return Sketchup::Model::VERSION_2021
		  else
			return Sketchup::Model::VERSION_2021
		end
	  end
	  
	  def save(path, version)
		if @mod.path.empty?
			@mod.save(path, version)
		else
			@mod.save_copy(path, version)
		end
		UI.messagebox(path)
	  end
	  
	  def main
	  
		prompts = ["Version"]
		defaults = ["2021"]
		list = ["3|4|5|6|7|8|2013|2014|2015|2016|2017|2018|2019|2020|2021"]
		input = UI.inputbox(prompts, defaults, list, "Option")
		
		if input.nil? or input.empty?
		    UI.messagebox('Please select version')
			return
		end
	    
		default_name = "project1.skp"
		if !@mod.name.nil? or !@mod.name.empty?
			default_name = @mod.name + ".skp"
		end
		
		default_path = File.join(ENV['Home'], 'Desktop')
		
		file_path = UI.savepanel("Save Skp File", default_path, default_name)
		
		if file_path.nil? or file_path.empty?
		    UI.messagebox('Please select a file storage location')
			return
		end

		self.save(ensure_skp_extension(file_path), check_version(input[0]))
		
      end
	  
    end
  end
end
