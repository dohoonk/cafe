class AddGeocodingFieldsToShops < ActiveRecord::Migration
  def change
    add_column :shops, :address, :string
    add_column :shops, :longitude, :float
    add_column :shops, :latitude, :float
  end
end
