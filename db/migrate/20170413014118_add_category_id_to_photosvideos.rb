class AddCategoryIdToPhotosvideos < ActiveRecord::Migration[5.0]
  def change
    add_column :photosvideos, :category_id, :int
  end
end