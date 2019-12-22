class Memory < ApplicationRecord

	belongs_to :user
	has_many :memory_photos

	accepts_nested_attributes_for :memory_photos
end
