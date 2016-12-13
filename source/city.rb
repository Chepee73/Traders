require_relative 'location.rb'
require_relative 'map.rb'

class City < Location
	attr_accessor :shops, :actions, :neighbours, :name
	def initialize name = "City", shops = [], actions = [:shops, :exit], neighbours = []
		@name = name
		@shops = shops
		@actions = actions	
		@neighbours = neighbours
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

	def add_neighbour city
		@neighbours << city unless @neighbours.include? city
		city.neighbours << self unless city.neighbours.include? self
	end

	def inspect
		to_s
	end

	def to_s
		@name
	end

end
