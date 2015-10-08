class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :description
      t.text :headline,  null: false
      t.text :neighborhood
      t.timestamps null: false
      t.string  :address
      t.float   :latitude
      t.float   :longitude
      t.belongs_to :user
    end
  end
end
