class DonationsController < ApplicationController
  
	def new
		@donation = Donation.new
	end
  
	def create
    user_params = params[:donation][:user]
    picked_at = donation_params[:picked_at]
    donation_params.delete(:picked_at)
		@donation = Donation.new(donation_params)
    @donation.picked_at = formatted_picked_at(picked_at)
    @donation.set_user(user_params)
    @donation.save
		flash[:notice] = "Great! Truck will you reach you soon "
		redirect_to locations_path
	end
  
  def formatted_picked_at(picked_at)
    format_str = "%m/%d/" + (picked_at =~ /\d{4}/ ? "%Y" : "%y")
    Date.parse(picked_at) rescue Date.strptime(picked_at, format_str)
  end
  
  
  private

  def donation_params
    params.require(:donation).permit(:user_id, :location_id, :picked_at, :feed_how_many, user_attributes: [:name, :phone]) 
  end
  
end
