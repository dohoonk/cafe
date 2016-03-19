class CreateTastes < ActiveRecord::Migration
  def change
    create_table :tastes do |t|
      t.integer :sweet
      t.integer :fruity
      t.integer :chocolate
      t.integer :bitter

      t.timestamps null: false
    end
  end
end
