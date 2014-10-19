class Donation < ActiveRecord::Base
	belongs_to :user
	belongs_to :location
	accepts_nested_attributes_for :user
end
