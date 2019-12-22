class Recommend < ApplicationRecord

	belongs_to :user
	has_many :recommend_photos

	#モデル同士が関連付けられている時に、ネストさせることで一度にまとめてレコードの更新ができる
	accepts_nested_attributes_for :recommend_photos
end
