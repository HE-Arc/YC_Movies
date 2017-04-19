class AddAttachmentImage2ToCarrousels < ActiveRecord::Migration
  def self.up
    change_table :carrousels do |t|
      t.attachment :image2
    end
  end

  def self.down
    remove_attachment :carrousels, :image2
  end
end
