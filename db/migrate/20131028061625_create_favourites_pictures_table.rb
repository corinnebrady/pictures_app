class CreateFavouritesPicturesTable < ActiveRecord::Migration
  def change
    create_table :favourites_pictures, :id => false do |t|
      t.integer :favourite_id
      t.integer :picture_id
    end
  end
end
