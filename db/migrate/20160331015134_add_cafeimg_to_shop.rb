class AddCafeimgToShop < ActiveRecord::Migration
  def change
    add_column :shops, :cafeimg, :string
  end
end
