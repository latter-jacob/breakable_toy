class AddColumnsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :username
      t.string :phone_number
      t.string :emergency_contact
      t.string :emergency_contact_phone
      t.string :emergency_contact_email
    end
    add_index :users, :username, unique: true
  end
end
