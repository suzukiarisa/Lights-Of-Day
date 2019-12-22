class MemoryPhoto < ApplicationRecord

	belongs_to :memory, optional: true
	mount_uploader :image, ImageUploader
end
