class Bot < ActiveRecord::Base
	has_many :buildings
	has_many :friend_supports
	belongs_to :user
	
	validates :name, presence: true
	def coordinates
		"#{coordinate_x}, #{coordinate_y}"
	end

	def closeCoords
		"#{close_x}, #{close_y}"
	end

	def emptyCoords
		"#{empty_x}, #{empty_y}"
	end

	def nextCoords
		"#{next_x}, #{next_y}"
	end

	def neighborCoords
		"#{neighbor_x}, #{neighbor_y}"
	end
end
