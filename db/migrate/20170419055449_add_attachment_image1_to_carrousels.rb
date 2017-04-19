class AddAttachmentImage1ToCarrousels < ActiveRecord::Migration
  def self.up
    change_table :carrousels do |t|
      t.attachment :image1
    end
  end

  def self.down
    remove_attachment :carrousels, :image1
  end
end
