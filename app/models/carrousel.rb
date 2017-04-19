class Carrousel < ApplicationRecord
has_attached_file :image1, styles: {  default: "750x350#"}, default_url: "/images/:style/missing.png", :size => { :less_than => 1.megabytes }
validates_attachment_content_type :image1, content_type: /\Aimage\/.*\z/
has_attached_file :image2, styles: {  default: "1250x500#"}, default_url: "/images/:style/missing.png", :size => { :less_than => 1.megabytes }
validates_attachment_content_type :image2, content_type: /\Aimage\/.*\z/
has_attached_file :image3, styles: {  default: "1520x550#"}, default_url: "/images/:style/missing.png", :size => { :less_than => 1.megabytes }
validates_attachment_content_type :image3, content_type: /\Aimage\/.*\z/
has_attached_file :image4, styles: {  default: "1920x624#"}, default_url: "/images/:style/missing.png", :size => { :less_than => 1.megabytes }
validates_attachment_content_type :image4, content_type: /\Aimage\/.*\z/

validates :image1_file_name, presence: true
validates :image2_file_name, presence: true
validates :image3_file_name, presence: true
validates :image4_file_name, presence: true

end
