class FriendSupport < ActiveRecord::Base
	belongs_to :bot

	validates :coordinate_x, :coordinate_y, presence: true

	def coordinates
		"#{coordinate_x}, #{coordinate_y}"
	end
end
