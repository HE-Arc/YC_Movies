class AddPhotosvideoToGaleries < ActiveRecord::Migration[5.0]
  def change
    add_reference :galeries, :photosvideo, foreign_key: true
  end
end
