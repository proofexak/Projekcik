class Bot < ActiveRecord::Base
	has_many :buildings
	has_many :friend_supports
	belongs_to :user
	
	validates :name, :coordinate_x, :coordinate_y, presence: true
	def coordinates
		"#{coordinate_x}, #{coordinate_y}"
	end
end
