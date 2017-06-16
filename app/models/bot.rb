class Bot < ActiveRecord::Base
	has_many :buildings

	validates :name, presence: true
end
