class CurrentLocations < ActiveRecord::Migration
  def change
    create_table :current_locations do |t|
      t.integer "user_id",   null: false
      t.string  "address"
      t.float   "latitude"
      t.float   "longitude"
    end
    add_index :current_locations, :user_id, unique: true
  end
end
