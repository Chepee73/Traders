#! /usr/bin/env ruby
require_relative 'shop.rb'
require_relative 'item.rb'
require_relative 'player.rb'
require_relative 'city.rb'
require_relative 'map.rb'

def main
	shop_a = Shop.new("Default Shop", [Item.new("Sword"), Item.new("Armor")])
	shop_b = Shop.new("Amazing Shop", [Item.new("Ultra Sword", 4555555, "Legendary")])
	cities = {"A": City.new([shop_a]), "B": City.new([shop_b])}
	map = Map.new(cities)
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
