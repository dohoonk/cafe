class CreateBeans < ActiveRecord::Migration
  def change
    create_table :beans do |t|
      t.string :name
      t.string :region
      t.string :taste_profile

      t.timestamps null: false
    end
  end
end
