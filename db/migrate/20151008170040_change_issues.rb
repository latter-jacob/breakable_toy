class ChangeIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :neighborhood, :string
    add_column :issues, :completed, :boolean
  end
end
