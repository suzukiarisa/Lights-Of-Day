class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :nickname, presence: true, length: { maximum: 10 }
  validates :favorite_artists, presence: true, length: { maximum: 30 }
  validates :email, presence: true


  belongs_to :prefecture, optional: true
  has_many :favorites, dependent: :destroy
  has_many :favorited_festivals, through: :favorites, source: :festival
  has_many :messages
  has_many :memories, dependent: :destroy
  has_many :recommends, dependent: :destroy

  #自分がフォローしているユーザーとの関連
  has_many :active_relationships, class_name: "UserRelationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  # ====================自分がフォローされるユーザーとの関連 ===================================
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: "UserRelationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  #acts_as_paranoidとは? データを論理削除する
  acts_as_paranoid

  def followed_by?(user)
# 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
      passive_relationships.find_by(following_id: user.id).present?
  end
end
