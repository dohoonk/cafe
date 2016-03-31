class Recipe < ActiveRecord::Base
  # friendly_id
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  # Carrierwave
  mount_uploader :recipeimg, RecipeimgUploader

  belongs_to :user
  has_many :comments, as: :commentable

  # likes
  has_many :recipe_likes, dependent: :destroy
  has_many :users, through: :recipe_likes

  validates :name, presence: true
  validates :grind, presence: true

  def recipe_like_for(user)
    recipe_likes.find_by_user_id(user)
  end

end
