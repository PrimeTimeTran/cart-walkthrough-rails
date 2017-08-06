class AddMainPhotoToFoods < ActiveRecord::Migration[5.1]
  def change
    add_column :food_items, :main_image, :string
  end
end
