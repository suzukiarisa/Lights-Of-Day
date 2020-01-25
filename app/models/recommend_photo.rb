class RecommendPhoto < ApplicationRecord

	validates :image, presence: true
	belongs_to :recommend, optional: true
	mount_uploader :image, ImageUploader
end
