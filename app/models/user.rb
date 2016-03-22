class User < ActiveRecord::Base
  has_secure_password
  has_many :shops, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :beans, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true,
            format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :password, presence: true, length: { minimum: 5 }
end
