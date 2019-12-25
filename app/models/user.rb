class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :nickname, presence: true, length: { maximum: 10 }
  validates :favorite_artists, presence: true, length: { maximum: 30 }
  validates :email, presence: true


  belongs_to :prefecture, optional: true
  has_many :favorites
  has_many :messages
  has_many :memories, dependent: :destroy
  has_many :recommends, dependent: :destroy
  has_many :user_relationships
  has_many :followings, through: :user_relationships, source: :follow
  has_many :reverse_of_user_relationships, class_name: 'UserRelationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_user_relationships, source: :user

  #acts_as_paranoidとは? データを論理削除する
  acts_as_paranoid

  def follow(other_user)
    unless self == other_user #フォローしようとしている other_user が自分自身ではないかを検証
      self.user_relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    user_relationship = self.user_relationships.find_by(follow_id: other_user.id)
    user_relationship.destroy if user_relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end
