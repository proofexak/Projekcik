class FriendSupport < ActiveRecord::Base
	belongs_to :bot

	validates :coordinate_x, :coordinate_y, :tavern_x, :tavern_y, presence: true

	def coordinates
		"#{coordinate_x}, #{coordinate_y}"
	end

	def tavern_coords
		"#{tavern_x}, #{tavern_y}"
	end
end
