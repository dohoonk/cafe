class Cafe < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :region, presence: true
  validates :method, presence: true
  validates :rating, presence: true
  validates :bean_name, presence: true
end
