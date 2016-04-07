class Bean < ActiveRecord::Base
  # friendly_id
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  # Carrierwave
  mount_uploader :beanimg, BeanimgUploader

  #beans
  has_many :bean_shop, dependent: :destroy
  has_many :shops, through: :bean_shop

  belongs_to :user
  has_many :comments, as: :commentable

  validates :name, presence: true
  validates :region, presence: true

  # likes
  has_many :bean_likes, dependent: :destroy
  has_many :users, through: :bean_likes

  def bean_like_for(user)
    bean_likes.find_by_user_id(user)
  end

  def self.search(search)
    where("name ILIKE ? OR roast ILIKE ? OR region ILIKE ?", "%#{search}%","%#{search}%","%#{search}%")
  end
end
