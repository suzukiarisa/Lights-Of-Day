class Article < ApplicationRecord

	has_many :memories
	has_many :recommends
	has_many :find_friends

	mount_uploader :image, ImageUploader
end
