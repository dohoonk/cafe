class Recipe < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :grind, presence: true
end
