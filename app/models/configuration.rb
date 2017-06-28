class Configuration < ActiveRecord::Base
  belongs_to :bot

  def fivemin_coords
		"#{fivemin_x}, #{fivemin_y}"
	end

	def close_coords
		"#{close_x}, #{close_y}"
	end

	def empty_coords
		"#{empty_x}, #{empty_y}"
	end

	def next_coords
		"#{next_x}, #{next_y}"
	end

	def neighbor_coords
		"#{neighbor_x}, #{neighbor_y}"
	end

	def support_bots
 		[close_x, close_y, empty_x, empty_y, next_x,
		 next_y, neighbor_x, neighbor_y]
	end

	def all_filled?
		support_bots.compact.size >= support_bots.size
	end
end
