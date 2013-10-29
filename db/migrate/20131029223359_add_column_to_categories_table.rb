class AddColumnToCategoriesTable < ActiveRecord::Migration
  def change
    add_column :categories, :owner_id, :integer
  end
end
