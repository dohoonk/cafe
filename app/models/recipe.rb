class Recipe < ActiveRecord::Base
  # Carrierwave
  mount_uploader :recipeimg, RecipeimgUploader

  belongs_to :user
  has_many :comments, as: :commentable

  validates :name, presence: true
  validates :grind, presence: true
end
