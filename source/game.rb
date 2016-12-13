require_relative 'shop.rb'
require_relative 'item.rb'
require_relative 'player.rb'
require_relative 'city.rb'
require_relative 'map.rb'

def main
	shop = Shop.new("Default Shop", [Item.new("Sword"), Item.new("Armor")])
	Player.location = City.new([shop])
	while true 
		update
	end
end

def update
	Player.act
end

main
