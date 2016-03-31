class CreateBeanLikes < ActiveRecord::Migration
  def change
    create_table :bean_likes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :bean, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
