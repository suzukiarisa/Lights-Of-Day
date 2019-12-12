class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 10 }
  validates :favorite_artists, presence: true, length: { maximum: 30 }
  validates :email, presence: true


  belongs_to :prefecture, optional: true
  has_many :favorites
  has_many :follows
  has_many :messages
  has_many :memories
  has_many :recommends
  has_many :articles
  has_many :find_friends

  #画像アップロード用gemのCarrierWave用
  mount_uploader :image, ImageUploader
  #acts_as_paranoidとは? データを論理削除する
  acts_as_paranoid

end
