class RecommendPhoto < ApplicationRecord

	belongs_to :recommend, optional: true
	mount_uploader :image, ImageUploader
end
