class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :description
      t.text :headline,  null: false
      t.belongs_to :neighborhood, null: false
      t.timestamps null: false
    end
  end
end
