class AddAttachmentImage4ToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :image4
    end
  end

  def self.down
    remove_attachment :categories, :image4
  end
end
