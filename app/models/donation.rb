class Donation < ActiveRecord::Base
	belongs_to :user
	belongs_to :location
  
	accepts_nested_attributes_for :user
  
  
  def set_user(user_params)
    self.user = User.new()
    self.user.name = user_params[:name]
    self.user.phone = user_params[:phone]
  end
  
end
