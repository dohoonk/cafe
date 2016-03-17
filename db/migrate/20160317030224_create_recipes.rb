class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :region
      t.string :roaster
      t.string :producer
      t.string :method
      t.string :taste
      t.integer :rating
      t.text :notes

      t.timestamps null: false
    end
  end
end
