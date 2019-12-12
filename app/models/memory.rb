class Memory < ApplicationRecord

	belongs_to :user
	belongs_to :article

	mount_uploader :image, ImageUploader
end
