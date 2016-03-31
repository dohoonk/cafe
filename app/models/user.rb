class User < ActiveRecord::Base
  # friendly_id
  extend FriendlyId
  friendly_id :first_name, use: [:slugged, :history]

  # Carrierwave
  mount_uploader :avatar, AvatarUploader

  # bcrypt
  has_secure_password

  has_many :shops, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :beans, dependent: :destroy
  has_many :comments, dependent: :destroy

  #likes
  has_many :bean_likes, dependent: :destroy
  has_many :like_beans, through: :bean_likes, source: :bean

  has_many :recipe_likes, dependent: :destroy
  has_many :like_recipes, through: :recipe_likes, source: :recipe

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true,
            format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
            unless: :from_omniauth?
  validates :password, presence: true, length: { minimum: 5 }

  # Twitter raw-data
  serialize :twitter_raw_data

  def self.find_from_omniauth(omniauth_data)
  User.where(provider: omniauth_data["provider"],
             uid:      omniauth_data["uid"]).first
  end

  def self.create_from_omniauth(omniauth_data)
  full_name = omniauth_data["info"]["name"].split
  User.create(uid:                      omniauth_data["uid"],
              provider:                 omniauth_data["provider"],
              first_name:               full_name[0],
              last_name:                full_name[1],
              twitter_consumer_token:   omniauth_data["credentials"]["token"],
              twitter_consumer_secret:  omniauth_data["credentials"]["secret"],
              twitter_raw_data:         omniauth_data,
              password:                 SecureRandom.hex(16)
              )
            end

  private

  def from_omniauth?
    uid.present? && provider.present?
  end
end
