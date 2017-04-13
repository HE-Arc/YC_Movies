class Picture < ApplicationRecord
	has_many :photosvideos, as: :imageable
	belongs_to :category

	def media
	  self.image.url(:large)
	end

	def media2
	  self.image.url(:thumbnail)
	end

	def media3
	  "picture"
	end



	after_create :after_add_to_picture
    before_destroy :before_delete_to_galerie
    before_update :update_photosvideos

  private
  def before_delete_to_galerie
    self.photosvideos.destroy_all
  end

  def update_photosvideos
    self.photosvideos.update_all(:category_id => self.category_id)
  end

  def after_add_to_picture
	  self.photosvideos.create!(:category_id => self.category_id)
  end

has_attached_file :image, styles: {  large: "1600x900>", thumbnail: "310x235#" }, default_url: "/images/:style/missing.png", :size => { :less_than => 1.megabytes }
validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
