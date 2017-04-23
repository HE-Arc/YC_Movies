class Photosvideo < ApplicationRecord
  has_many :pictures, :dependent => :delete_all
  has_many :videos, :dependent => :delete_all
  belongs_to :type
  belongs_to :category
  accepts_nested_attributes_for :videos, :pictures,:allow_destroy => true
  before_create :validate_category_already_exist_create
  before_update :validate_category_already_exist_update

  def validate_category_already_exist_create
  	if Category.find(self.category_id).photosvideos.where(type_id: self.type_id).count > 0
      errors.add(:error, "This category already exist")
      throw :abort
    end
  end
  def validate_category_already_exist_update
  	if Category.find(self.category_id).photosvideos.where(type_id: self.type_id).count > 0
  	  if Photosvideo.find(self.id).category.id != self.category_id
        errors.add(:error, "This category already exist")
        throw :abort
      end
    end
  end
end