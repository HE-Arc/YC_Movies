class Picture < ApplicationRecord
belongs_to :photosvideo

	def media
	  self.image.url(:large)
	end

	def media2
	  self.image.url(:thumbnail)
	end

	def media3
	  "picture"
	end


has_attached_file :image, styles: {  large: "1600x900>", thumbnail: "310x235#" }, default_url: "/images/:style/missing.png", :size => { :less_than => 1.megabytes }
validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
