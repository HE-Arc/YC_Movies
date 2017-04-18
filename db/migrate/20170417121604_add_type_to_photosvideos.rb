class AddTypeToPhotosvideos < ActiveRecord::Migration[5.0]
  def change
    add_reference :photosvideos, :type, foreign_key: true
  end
end
