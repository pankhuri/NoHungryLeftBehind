class Location < ActiveRecord::Base

	has_ancestry

	geocoded_by :name
	after_validation :geocode, :if => :name_changed?
end
