class AddIsPassedToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :is_passed, :boolean, :default => false
  end
end
