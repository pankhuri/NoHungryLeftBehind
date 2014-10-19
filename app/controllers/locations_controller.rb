class LocationsController < ApplicationController
  respond_to :json, :html, :js  
  def index
    @locations = Location.stop_locations
    initialize_donation
    @location_hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      if location.type == 'DropLocation'
        image_url = "/assets/yellow_icon.png"
      else
        image_url = "/assets/red_icon.png"
      end
      marker.picture({
                  :url => image_url,
                  :width   => 32,
                  :height  => 32
                  })
      marker.json({:title => "DSdsdf"})
      marker.infowindow location.name
    end
  end

  def update
    @locations = Location.stop_locations
    @locations.update_all(is_passed: false)
    render json: @locations    
  end

  def show
    @location = Location.find(params[:id])
    render json: @location
  end

  def location_params
    params.require(:location_params).permit(:id, :name, :position, :latitude, :longitude, :city)
  end
  
  def initialize_donation
    @donation = Donation.new
  end
  
end
