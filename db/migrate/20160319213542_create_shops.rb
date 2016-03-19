class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :phone_number
      t.string :address
      t.string :website

      t.timestamps null: false
    end
  end
end
