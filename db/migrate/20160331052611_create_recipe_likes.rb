class CreateRecipeLikes < ActiveRecord::Migration
  def change
    create_table :recipe_likes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
