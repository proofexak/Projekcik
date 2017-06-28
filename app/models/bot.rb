class Bot < ActiveRecord::Base
	self.inheritance_column = nil

	has_many :buildings
	has_many :friend_supports
	has_one :configuration
	belongs_to :user

	validates :name, presence: true
	validates :type, inclusion: { in: %w(production support),
    message: "%{value} is not a valid type" }
    
end
