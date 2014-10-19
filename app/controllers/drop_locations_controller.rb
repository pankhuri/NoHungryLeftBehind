class DropLocationsController < ApplicationController
	respond_to :json, :html, :js
	def update
		@drop_location = DropLocation.find_by(latitude: drop_location_params[:latitude], longitude: drop_location_params[:longitude])
		@drop_location.update_column(is_passed: true )			
	end	

	def drop_location_params
		params.require(:drop_location).permit!
	end

end
