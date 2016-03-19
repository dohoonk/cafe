class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_recipe, only: [:show,:destroy,:edit,:update]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new recipe_params
    if @recipe.save
      redirect_to recipes_path, alert: "Delicious"
    else
      flash[:alert] = "Failed to create"
      render :new
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def edit
  end

  def update
    if @recipe.update recipe_params
      redirect_to recipe_path(@recipe), alert: "Super Delicious"
    else
      flash[:alert] = "Could not update"
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    recipe_params = params.require(:recipe).permit(:name,:region,:roaster,:producer,:method,:rating,:notes,:grind,:private,:user_id)
  end

  def find_recipe
    @recipe = Recipe.find params[:id]
  end
end
