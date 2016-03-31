class AddRecipeimgToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :recipeimg, :string
  end
end
