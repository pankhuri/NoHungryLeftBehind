class TruckLocationsController < ApplicationController

  respond_to :json, :html, :js
  # def index
  #   #@locations = Location.all
  #   @locations = [{ lat: 43, lng: 3.5},
  #     { lat: 45, lng: 4},
  #     { lat: 49, lng: 4},
  #     { lat: 51, lng: 3.5}
  #   ]
  #   @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
  #     marker.lat location[:lat]
  #     marker.lng location[:lng]
  #     debugger
  #     marker.picture({
  #       :url => "https://maps.google.com/mapfiles/kml/shapes/parking_lot_maps.png",
  #       :width   => 32,
  #       :height  => 32
  #       })
  #     marker.json({:title => "DSdsdf"})
  #   end
  # end

  def update
    @truck_location = TruckLocation.last
    if !@truck_location
      @truck_location = TruckLocation.new
    end
    @truck_location.attributes = truck_location_params
  end

  def show
    @truck_location = TruckLocation.last
    if !@truck_location
      @truck_location = PickUpLocation.first
    end
    render json: @truck_location, status: :created
  end

  def truck_location_params
    params.require(:truck_location).permit!
  end


end
