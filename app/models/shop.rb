class Shop < ActiveRecord::Base
  # friendly_id
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  # Geocoder
  geocoded_by :address
  after_validation :geocode

  # Carrierwave
  mount_uploader :cafeimg, CafeimgUploader

  belongs_to :user
  has_many :comments, as: :commentable

  has_many :beans, dependent: :nullify

  #beans
  has_many :bean_shop, dependent: :destroy
  has_many :beans_shop, through: :bean_shop, source: :beans

  #likes
  has_many :shop_likes, dependent: :destroy
  has_many :users, through: :shop_likes

  validates :name, presence: true
  validates :phone_number, presence: true

  def shop_like_for(user)
    shop_likes.find_by_user_id(user)
  end

  def self.search(search)
    where("name ILIKE ? OR website ILIKE ? OR address ILIKE ?", "%#{search}%","%#{search}%","%#{search}%")
  end
end
