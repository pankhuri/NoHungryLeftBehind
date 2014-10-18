class LocationsController < ApplicationController
  
  def index
    #@locations = Location.all
    # @locations = [{ lat: 43, lng: 3.5},
    # { lat: 45, lng: 4},
    # { lat: 49, lng: 4},
    #  { lat: 51, lng: 3.5}]
    @locations = [{lat: 28.6327418, lng: 77.08560849999999}, {lat: 28.6367863, lng: 77.0961263}, {lat: 28.6360125, lng: 77.09738089999999}, {lat: 28.6377117, lng: 77.0997412}, {lat: 28.6381848, lng: 77.0994321}, {lat: 28.6367192, lng: 77.0963446}]
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location[:lat]
      marker.lng location[:lng]
      marker.picture({
                  :url => "https://maps.google.com/mapfiles/kml/shapes/parking_lot_maps.png",
                  :width   => 32,
                  :height  => 32
                  })
      marker.json({:title => "DSdsdf"})
    end
  end
  
end
