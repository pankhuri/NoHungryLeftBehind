class TruckLocationsController < ApplicationController
  
  def index
    #@locations = Location.all
    @locations = [{ lat: 43, lng: 3.5},
    { lat: 45, lng: 4},
    { lat: 49, lng: 4},
    { lat: 51, lng: 3.5}]
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location[:lat]
      marker.lng location[:lng]
      debugger
      marker.picture({
                  :url => "https://maps.google.com/mapfiles/kml/shapes/parking_lot_maps.png",
                  :width   => 32,
                  :height  => 32
                  })
      marker.json({:title => "DSdsdf"})
    end
  end

  def update
    TruckLocation.update()
  end
  
end
