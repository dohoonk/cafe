class Bean < ActiveRecord::Base
  # friendly_id
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  # Carrierwave
  mount_uploader :beanimg, BeanimgUploader
  belongs_to :user
  has_many :comments, as: :commentable
  validates :name, presence: true
  validates :region, presence: true

end
