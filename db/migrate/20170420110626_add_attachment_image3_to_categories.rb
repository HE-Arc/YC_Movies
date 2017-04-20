class AddAttachmentImage3ToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :image3
    end
  end

  def self.down
    remove_attachment :categories, :image3
  end
end
