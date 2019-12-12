class Favorite < ApplicationRecord

	belongs_to :user
	belongs_to :festival
	validates_uniqueness_of :festival_id, scope: :user_id


	acts_as_paranoid
  def favorited_by?(user,festival)
    Favorite.where(user_id: user.id).where(festival_id: festival.id).exists?
  end
end
