class AddAttributesToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :bean_name, :string
    add_column :recipes, :grind, :string
    add_column :recipes, :private, :boolean
  end
end
