require_relative 'location.rb'

class Player
	class << self
		attr_accessor :inventary, :cash, :location

		def initialize inventary, cash = 5000, location = nil
			@inventary = inventary
			@cash = cash
			@location = location
		end

		def get_item item
			intentary.add_item item
		end

		def has_enough_cash? amount
			amount <= cash ? true : false
		end

		def pay amount
			if has_enough_cash? amount
				@cash -= amount
			end
		end

		def buy_item item
			if has_enough_cash? item.cost
				get_item item
				pay item.cost
			end
		end
		
		def change_location location
			@location = location
			@location.enter
		end
		
		def act
			@location.enter
		end
	end
end
