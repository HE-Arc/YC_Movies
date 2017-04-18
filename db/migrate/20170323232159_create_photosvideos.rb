class CreatePhotosvideos < ActiveRecord::Migration[5.0]
  def change
    create_table :photosvideos do |t|

      t.timestamps
 	  end
   end
end
