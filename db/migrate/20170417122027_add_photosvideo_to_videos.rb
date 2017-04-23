class AddPhotosvideoToVideos < ActiveRecord::Migration[5.0]
  def change
    add_reference :videos, :photosvideo, foreign_key: true
  end
end
