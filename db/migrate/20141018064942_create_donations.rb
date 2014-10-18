class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
    	t.references :user
    	t.references :location
    	t.datetime :picked_at
    	t.string :feed_how_many
      t.timestamps
    end
  end
end
