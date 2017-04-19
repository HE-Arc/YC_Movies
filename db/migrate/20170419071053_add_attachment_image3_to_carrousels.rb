class AddAttachmentImage3ToCarrousels < ActiveRecord::Migration
  def self.up
    change_table :carrousels do |t|
      t.attachment :image3
    end
  end

  def self.down
    remove_attachment :carrousels, :image3
  end
end
