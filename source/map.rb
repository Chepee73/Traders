require 'gratr/import'

class Map < Location
	attr_accessor :cities, :actual_city

	def self.actual_map=value
		@actual_map = value
	end

	def self.actual_map
		@actual_map
	end

	def initialize cities = {}, actual_city = nil
		@cities = cities
		@actual_city = actual_city
	end

	def nearby_cities
		
	end

	def add_route_from(city_a, city_b)
		@cities[city_a].neightbours << city_b
	end

	def get_routes_from(city)
		@cities[city].neighbours
	end

	def show_actions
		super
		# Couldn't think of another name. be careful with the @
		cities = []
		@cities.each_with_index do |(city_name, city_location), i|
			print "#{i + 1} - #{city_name}  \n"
			cities << city_location
		end 
		option = gets.to_i
		unless option > cities.count
			Player.change_location(cities[option - 1])
			@actual_city = cities[option - 1]
		end
	end
end
