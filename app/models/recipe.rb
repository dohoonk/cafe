class Recipe < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :cofee, presence: true
  validates :website, presence: true
end
