class DropLocationsController < ApplicationController
	respond_to :json, :html, :js
	def update
		@drop_location = DropLocation.where("latitude like '%?%' and longitude like '%?%'", drop_location_params[:latitude], drop_location_params[:longitude]).first()
		@drop_location.update_column(is_passed: true )			
	end	

	def drop_location_params
		params.require(:drop_location).permit(:name, :position, :latitude, :longitude, :city)
	end

end
