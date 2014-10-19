class PickUpLocationsController < ApplicationController
  respond_to :json, :html, :js
  def update
    @pick_up_location = PickUpLocation.find_by(latitude: pick_up_location_params[:latitude], longitude: pick_up_location_params[:longitude])
    @pick_up_location.update_column(is_passed: true )      
  end 

  def pick_up_location_params
    params.require(:pick_up_location).permit!
  end
    
end
