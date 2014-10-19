class AddCityInLocations < ActiveRecord::Migration
  def change
    Location.destroy_all
    add_column :locations, :city, :string
    add_column :locations, :position, :integer, :default => 0
  end
end
