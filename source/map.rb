class Map < Location
	attr_accessor :cities, :actual_city

	def self.actual_map=value
		@actual_map = value
	end

	def self.actual_map
		@actual_map
	end

	def initialize cities = [], actual_city = nil
		@cities = cities
		@actual_city = actual_city
	end

	def nearby_cities
		
	end

	def add_route_from(city_a, city_b)
	end

	def get_routes_from(city)
		city.neighbours
	end

	def show_actions
		super
		# Couldn't think of another name. be careful with the @
		#cities = []
		#@cities.each_with_index do |(city_name, city_location), i|
		#	print "#{i + 1} - #{city_name}  \n"
		#	cities << city_location
		#end 
		#select_option cities do |option|
		#	Player.change_location(cities[option])
		#	@actual_city = cities[option]
		#end
		unless @actual_city.nil?
			routes = get_routes_from(@actual_city)
			print_actions routes
			puts "#{routes.count + 1} - Enter city"
			select_option routes do |option|
				if option < routes.count
					@actual_city = routes[option]
				else
					Player.change_location @actual_city
				end				
			end
		end
	end
end
