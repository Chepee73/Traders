require 'gratr/import'

class Map
	attr_accessor :cities, :actual_city

	def initialize cities = {}, actual_city = nil
		@cities = cities
		@actual_city = actual_city
	end

	def nearby_cities
		
	end

	def add_route_from(city_a, city_b)
		@cities[city_a].neightbours << city_b
	end

	def get_routes_from city
		@cities[city].neighbours
	end

end
