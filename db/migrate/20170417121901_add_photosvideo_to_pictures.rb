class AddPhotosvideoToPictures < ActiveRecord::Migration[5.0]
  def change
    add_reference :pictures, :photosvideo, foreign_key: true
  end
end
