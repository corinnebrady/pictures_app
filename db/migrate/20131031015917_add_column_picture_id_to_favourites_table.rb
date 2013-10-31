class AddColumnPictureIdToFavouritesTable < ActiveRecord::Migration
  def change
    add_column :favourites, :picture_id, :integer
  end
end
