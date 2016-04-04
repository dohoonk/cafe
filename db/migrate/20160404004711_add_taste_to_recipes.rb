class AddTasteToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :sweet, :integer
    add_column :recipes, :fruity, :integer
    add_column :recipes, :bitter, :integer
    add_column :recipes, :chocolate, :integer
  end
end
