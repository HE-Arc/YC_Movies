class AddAttachmentImage1ToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :image1
    end
  end

  def self.down
    remove_attachment :categories, :image1
  end
end
