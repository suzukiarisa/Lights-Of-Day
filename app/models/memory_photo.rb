class MemoryPhoto < ApplicationRecord

	validates :image, presence: true
	belongs_to :memory, optional: true
	mount_uploader :image, ImageUploader
end
