class PickUpLocationsController < ApplicationController
  respond_to :json, :html, :js
  def update
    @pick_up_location = PickUpLocation.where("latitude like '%?%' and longitude like '%?%'", pick_up_location_params[:latitude].to_f, pick_up_location_params[:longitude].to_f).first()
    @pick_up_location.update_attributes(is_passed: true )      
    render json: @pick_up_location
  end 

  def pick_up_location_params
    params.require(:pick_up_location).permit(:name, :position, :latitude, :longitude, :city)
  end
    
end
