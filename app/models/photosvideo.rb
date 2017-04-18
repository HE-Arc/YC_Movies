class Photosvideo < ApplicationRecord
  has_many :pictures, :dependent => :delete_all
  has_many :galeries, :dependent => :delete_all
  belongs_to :type
  belongs_to :category
  accepts_nested_attributes_for :galeries, :pictures,:allow_destroy => true
  validate :validate_category_already_exist

  def validate_category_already_exist
    errors.add(:error, "This category already exist") if Type.find(self.type_id).photosvideos.where(category_id: self.category_id).count > 1
  end


end
