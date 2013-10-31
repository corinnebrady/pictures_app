class RemoveColumnUserIdFromFavouritesTable < ActiveRecord::Migration
  def change
    remove_column :favourites, :user_id
  end
end
