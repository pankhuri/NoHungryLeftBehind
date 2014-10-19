class UsersController < ApplicationController
  
  def index
    @donation = Donation.new
  end
  
end
