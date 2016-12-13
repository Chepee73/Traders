require_relative 'location.rb'
require_relative 'map.rb'

class City < Location
	attr_accessor :shops, :actions
	def initialize shops = [], actions = [:shops, :exit]
		@shops = shops
		@actions = actions	

		@shops.each do |shop|
			shop.location = self
		end
	end

	def show_actions
		super
		print_actions @actions
		select_option @actions do |option|
			send(@actions[option])
		end
	end

	def shops
		system("clear")
		#unless @shops.count < 1
		#	@shops.each_with_index do |shop, i|
		#		puts "#{i + 1} - #{shop.name}"
		#	end
		#	puts "#{@shops.count + 1} - exit"
		#	option = gets.strip.to_i
		#	unless option > @shops.count
		#		Player.change_location @shops[option - 1]
		#	else
		#		Player.change_location self
		#	end
		#end
		print_actions @shops
		puts "#{@shops.count + 1} - exit"
		select_option @shops do |option|
			if option < @shops.count
				Player.change_location @shops[option]
			else
				Player.change_location self
			end
		end	
	end
	
	def exit
		Player.change_location Map.actual_map
	end
end
