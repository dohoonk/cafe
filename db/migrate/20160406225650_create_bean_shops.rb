class CreateBeanShops < ActiveRecord::Migration
  def change
    create_table :bean_shops do |t|
      t.references :bean, index: true, foreign_key: true
      t.references :shop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
