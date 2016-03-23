class Shop < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  
  belongs_to :user
  has_many :comments, as: :commentable

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :website, presence: true
end
