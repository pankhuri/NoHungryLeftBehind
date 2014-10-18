class AddTypeToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :type, :string
    add_column :locations, :ancestry, :string
    change_column :locations, :latitude, :float
    change_column :locations, :longitude, :float
    add_index :locations, :ancestry
  end
end
