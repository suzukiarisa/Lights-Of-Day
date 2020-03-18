class Memory < ApplicationRecord

	validates :spot, presence: true
    validates :title, presence: true, length: { maximum: 35 }
    validates :body, length: { maximum: 75 }

	belongs_to :user
	has_many :memory_photos

	accepts_nested_attributes_for :memory_photos
end
