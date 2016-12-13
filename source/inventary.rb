class Inventary
	attr_accessor :item_list

	def initialize item_list = []
		@item_list = item_list
	end
	
	def add_item item
		@item_list << item
	end

end
