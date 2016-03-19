class User < ActiveRecord::Base
  has_many :cafes, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :beans, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }
end
