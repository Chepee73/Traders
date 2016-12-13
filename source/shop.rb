require_relative 'player.rb'
require_relative 'location.rb'
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
		print_actions @actions
		select_option @actions do |option|
			send(@actions[option])
		end
	end

	def buy
		system("clear")
		print_actions @items_on_sale
		puts "#{@items_on_sale.count + 1} - exit"
		if @items_on_sale.count == 0
			puts "There's nothing on sale."
			gets
		else
			select_option @items_on_sale do |option|
				unless option >= @items_on_sale.count
					sell_item option
					buy
				else
					Player.change_location self
				end
			end
		end
	end

	def inspect
		to_s
	end

	def to_s
		@name
	end

	def exit
		Player.change_location @location unless @location.nil?
	end
end
