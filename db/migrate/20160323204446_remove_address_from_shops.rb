class RemoveAddressFromShops < ActiveRecord::Migration
  def change
    remove_column :shops, :address, :string
  end
end
