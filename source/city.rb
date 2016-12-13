require_relative 'location.rb'

class City < Location
	attr_accessor :shops, :actions
	def initialize shops = [], actions = [:shops]
		@shops = shops
		@actions = actions	

		@shops.each do |shop|
			shop.location = self
		end
	end

	def show_actions
		super
		unless @actions.count < 1
			@actions.each_with_index do |action, i|
				puts "#{i + 1} - #{action.to_s}"
			end
			option = gets.strip.to_i
			if option <= @actions.count
				send(actions[option - 1])
			end
		end
	end

	def shops
		system("clear")
		unless @shops.count < 1
			@shops.each_with_index do |shop, i|
				puts "#{i + 1} - #{shop.name}"
			end
			option = gets.strip.to_i
			unless option > @shops.count
				Player.change_location @shops[option - 1]
			end
		end	
	end

end
