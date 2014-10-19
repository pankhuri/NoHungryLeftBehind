class PickUpLocationsController < ApplicationController
  respond_to :json, :html, :js
  def update
    @pick_up_location = PickUpLocation.where("latitude like '%?%' and longitude like '%?%'", pick_up_location_params[:latitude], pick_up_location_params[:longitude]).first()
    @pick_up_location.update_column(is_passed: true )      
  end 

  def pick_up_location_params
    params.require(:pick_up_location).permit(:name, :position, :latitude, :longitude, :city)
  end
    
end
