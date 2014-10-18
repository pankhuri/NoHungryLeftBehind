class Location < ActiveRecord::Base

	has_ancestry

	geocoded_by :name
	after_validation :geocode, :if => :name_changed?
  
  
  def self.route_steps(origin, destination)
    @request = Net::HTTP.get(URI.parse("https://maps.googleapis.com/maps/api/directions/json?origin=#{origin[:latitude]},#{origin[:longitude]}&destination=#{destination[:latitude]},#{destination[:longitude]}&key=#{GOOGLE_API_KEY}"))
    hash = JSON.parse @request
    if hash["routes"] && hash["routes"].first.present?
      steps = hash["routes"].first["legs"].first["steps"].collect{|step| step["end_location"]}
    else
      return hash["routes"]
    end
  end
  
end
