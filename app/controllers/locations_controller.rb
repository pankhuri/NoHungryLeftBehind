class LocationsController < ApplicationController
  
  def index
    @locations = Location.stop_locations
    @location_hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.picture({
                  :url => "https://maps.google.com/mapfiles/kml/shapes/parking_lot_maps.png",
                  :width   => 32,
                  :height  => 32
                  })
      marker.json({:title => "DSdsdf"})
    end
  end
  
end
