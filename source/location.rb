class Location
	
	def enter
		system("clear")
		show_actions
	end
	
	def show_actions
	end

	def print_actions actions
		unless actions.count < 1
			actions.each_with_index do |opt, i|
				puts "#{i + 1} - #{opt.to_s}"
			end
		end  	
	end

	def select_option options, &block
		if block_given?
			option = gets.strip.to_i
			yield option - 1
		end
	end

end
