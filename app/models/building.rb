class Building < ActiveRecord::Base
	self.inheritance_column = nil
	
  belongs_to :bot
  validates :name, :coordinate_x, :coordinate_y, presence: true
  validates :type, inclusion: { in: %w(production residential),
    message: "%{value} is not a valid type" }

  def coordinates
		"#{coordinate_x}, #{coordinate_y}"
	end
end
