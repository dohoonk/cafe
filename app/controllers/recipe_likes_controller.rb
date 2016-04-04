class RecipeLikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @recipe_like = current_user.recipe_likes.new
    @recipe = Recipe.friendly.find params[:recipe_id]
    @recipe_like.recipe = @recipe
    if @recipe_like.save
      redirect_to @recipe, notice: "Liked!"
    else
      redirect_to @recipe, notice: "Can't be liked!"
    end
  end

  def destroy
    @recipe = Recipe.friendly.find params[:recipe_id]
    @recipe_like = current_user.recipe_likes.find params[:id]
    @recipe_like.destroy
    redirect_to @recipe, notice: "Unliked"
  end
end
