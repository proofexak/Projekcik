class Bot < ActiveRecord::Base
	has_many :buildings
	belongs_to :user
	
	validates :name, presence: true
end
