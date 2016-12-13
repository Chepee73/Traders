class Item
	attr_accessor :cost, :rarity, :name
	
	def initialize name = "Default", cost = 0, rarity = 'normal'
		@cost = cost
		@rarity = rarity
		@name = name
	end
	
	def inspect
		to_s
	end
	
	def to_s
		"#{@name} - #{@rarity} - #{@cost}"
	end
end
