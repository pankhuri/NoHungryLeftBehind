class TruckLocationsController < ApplicationController

  respond_to :json, :html, :js
  
  def update
    @truck_location = TruckLocation.last
    if !@truck_location
      @truck_location = TruckLocation.new
    end
    @truck_location.attributes = truck_location_params
    render json: @truck_location
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
