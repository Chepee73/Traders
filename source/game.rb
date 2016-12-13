#! /usr/bin/env ruby
require_relative 'shop.rb'
require_relative 'item.rb'
require_relative 'player.rb'
require_relative 'city.rb'
require_relative 'map.rb'
def main
	shop_a = Shop.new("Default Shop", [Item.new("Sword"), Item.new("Armor")])
	shop_b = Shop.new("Amazing Shop", [Item.new("Ultra Sword", 4555555, "Legendary")])
	shop_c = Shop.new("Regular Shop", [Item.new("Simple sword", 250, "Common"), Item.new("Shield", 200, "Common")])
	cities = {"A": City.new("City A", [shop_a]), "B": City.new("City B", [shop_b]), "C": City.new("City C", [shop_c])}
	cities[:A].add_neighbour(cities[:B])
	cities[:B].add_neighbour(cities[:C])
	map = Map.new(cities, actual_city = cities[:A])
	map.add_route_from("A", "B")
	Map.actual_map = map
	Player.location = Map.actual_map	
	while true 
		update
	end
end

def update
	Player.act
end

main
