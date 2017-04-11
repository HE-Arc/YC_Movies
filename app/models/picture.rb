class Picture < ApplicationRecord
	has_many :photosvideos, as: :imageable
	def media
	  self.image.url(:large)
	end

	def media2
	  self.image.url(:medium)
	end

	def media3
	  "picture"
	end



	after_create :after_add_to_picture
    before_destroy :before_delete_to_galerie

  private
  def before_delete_to_galerie
    self.photosvideos.destroy_all
  end

	def after_add_to_picture
	  self.photosvideos.create!
	end

has_attached_file :image, styles: {  large: "640x360>", medium: "300x300#", thumb: "100x100>" }, default_url: "/images/:style/missing.png", :size => { :less_than => 1.megabytes }
validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
