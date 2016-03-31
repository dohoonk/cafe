class AddBeanimgToBean < ActiveRecord::Migration
  def change
    add_column :beans, :beanimg, :string
  end
end
