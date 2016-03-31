class Bean < ActiveRecord::Base
  # Carrierwave
  mount_uploader :beanimg, BeanimgUploader
  belongs_to :user
  has_many :comments, as: :commentable
  validates :name, presence: true
  validates :region, presence: true

end
