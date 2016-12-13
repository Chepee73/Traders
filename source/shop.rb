require_relative 'location.rb'
require_relative 'player.rb'

class Shop < Location
	attr_accessor :items_on_sale, :actions, :name, :location
	
	def initialize name = "Default", items_on_sale = [], actions = [:buy, :exit]
		@items_on_sale = items_on_sale
		@actions = actions
		@name = name
	end
	
	def sell_item item_number
		system("clear")
		# in the future maybe add this:
		# @founds += @items_on_sale[item_number].cost
		if item_number < @items_on_sale.count
			item = @items_on_sale.delete_at item_number
			puts "Item #{item.name} sold."

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

	def buy
		system("clear")
		if @items_on_sale.count > 0
			@items_on_sale.each_with_index do |item, i|
				puts "#{i + 1} - #{item.name} - #{item.rarity}"
			end
			option = gets.strip.to_i 
			sell_item option - 1
			buy
		else
			puts "Theres nothing on sale."
			gets
		end
	end

	def exit
		Player.change_location @location unless @location.nil?
	end
end
