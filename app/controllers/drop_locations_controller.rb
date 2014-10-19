class DropLocationsController < ApplicationController
	respond_to :json, :html, :js
	def update
		@drop_location = DropLocation.where("cast(latitude as text) like '%?%' and cast(longitude as text) like '%?%'", drop_location_params[:latitude].to_f, drop_location_params[:longitude].to_f).first()
		@drop_location.update_attributes(is_passed: true )
		render json: @drop_location
	end	

	def drop_location_params
		params.require(:drop_location).permit(:name, :position, :latitude, :longitude, :city)
	end

end

