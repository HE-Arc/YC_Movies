class AddAttachmentImage4ToCarrousels < ActiveRecord::Migration
  def self.up
    change_table :carrousels do |t|
      t.attachment :image4
    end
  end

  def self.down
    remove_attachment :carrousels, :image4
  end
end
