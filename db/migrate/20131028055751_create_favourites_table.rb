class CreateFavouritesTable < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.string :name
      t.string :user_id
      t.timestamps
    end
  end
end
