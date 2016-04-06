class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_recipe, only: [:show,:destroy,:edit,:update]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new recipe_params
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipes_path, alert: "Delicious"
    else
      flash[:alert] = "Failed to create"
      render :new
    end
  end

  def index
    @recipes = Recipe.order("name").page(params[:page]).per(6)
    if params[:search]
    @recipes = Recipe.search(params[:search]).order("name").page(params[:page]).per(6)
    else
    @recipes = Recipe.all.order('name').page(params[:page]).per(6)
    end
  end

  def show
    @commentable = @recipe
    @comment = Comment.new
    @recipe_like = @recipe.recipe_like_for(current_user)
  end

  def edit
    can_authorize(:edit,@recipe)
  end

  def update
    can_authorize(:update,@recipe)
    if @recipe.update recipe_params
      redirect_to recipe_path(@recipe), alert: "Super Delicious"
    else
      flash[:alert] = "Could not update"
      render :edit
    end
  end

  def destroy
    can_authorize(:destroy,@recipe)
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    recipe_params = params.require(:recipe).permit(:name,:region,:roaster,:producer,:method,:rating,:notes,:grind,:private,:user_id,:recipeimg,:slug,:sweet,:fruity,:bitter,:chocolate)
  end

  def find_recipe
    @recipe = Recipe.friendly.find params[:id]
  end
end
