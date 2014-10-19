class DonationsController < ApplicationController
	def new
		@donation = Donation.new
	end
	def create
		donation = Donation.create(param[:donations])
		flash[:notice] = "Great! Truck will you reach you around #{donation.picked_at} at #{donation.location.} "
		redirect to "/locations"
	end
end
