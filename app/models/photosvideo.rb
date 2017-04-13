class Photosvideo < ApplicationRecord
	belongs_to :imageable, polymorphic: true
	#belongs_to :galeries, foreign_key: 'imageable_id', conditions: "photosvideos.imageable_type = 'Galerie'"
	belongs_to :picture, foreign_type: 'Picture', foreign_key: 'imageable_id'
	belongs_to :galerie, foreign_type: 'Galerie', foreign_key: 'imageable_id'
	#belongs_to :pictures, foreign_key: 'imageable_id', conditions: "photosvideos.imageable_type = 'Picture'"
end
