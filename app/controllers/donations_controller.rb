class DonationsController < ApplicationController
  
	def new
		@donation = Donation.new
	end
  
	def create
    user_params = params[:donation][:user]
		@donation = Donation.new(donation_params)
    @donation.set_user(user_params)
    @donation.save
		flash[:notice] = "Great! Truck will you reach you around #{@donation.picked_at} at ahaaa "
		redirect_to locations_path
	end
  
  
  private

  def donation_params
    params.require(:donation).permit(:user_id, :location_id, :picked_at, :feed_how_many, user_attributes: [:name, :phone]) 
  end
  
end
