class AddAttachmentImage2ToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :image2
    end
  end

  def self.down
    remove_attachment :categories, :image2
  end
end
