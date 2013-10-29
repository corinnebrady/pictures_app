class CreatePicturesTable < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.text :picture
      t.string :description
      t.integer :user_id
      t.timestamps
    end
  end
end
