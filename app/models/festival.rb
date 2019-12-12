class Festival < ApplicationRecord

	acts_as_paranoid

	has_many :favorites
    has_many :favorited_users, through: :favorites, source: :user
    belongs_to :festival_names
    belongs_to :place

  def favorited_by?(user)
    self.favorites.where(user_id: user.id).exists?
  end

    attachment :image
end
