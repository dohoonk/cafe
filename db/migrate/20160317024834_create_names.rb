class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.integer :phone_number
      t.string :address
      t.string :website

      t.timestamps null: false
    end
  end
end
