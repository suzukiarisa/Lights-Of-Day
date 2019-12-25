class Festival < ApplicationRecord

	acts_as_paranoid

	has_many :favorites
    has_many :favorited_users, through: :favorites, source: :user
    belongs_to :festival_name
    belongs_to :place

    attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
