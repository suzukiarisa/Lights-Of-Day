class Favorite < ApplicationRecord

	belongs_to :user
	belongs_to :festival
	validates_uniqueness_of :festival_id, scope: :user_id

	acts_as_paranoid
end
