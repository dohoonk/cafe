class CreateShopLikes < ActiveRecord::Migration
  def change
    create_table :shop_likes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :shop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
