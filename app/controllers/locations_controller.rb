class LocationsController < ApplicationController
  respond_to :json, :html, :js  
  def index
    @locations = Location.stop_locations
    @location_hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.picture({
                  :url => "/assets/red_icon.png",
                  :width   => 32,
                  :height  => 32
                  })
      marker.json({:title => "DSdsdf"})
      marker.infowindow location.name
    end
  end

  def update
    @locations = Location.stop_locations
    @locations.update_all(is_passed: true)
    render json: @locations    
  end
  
end
