class Category < ApplicationRecord
	has_many :photosvideos, dependent: :destroy
end