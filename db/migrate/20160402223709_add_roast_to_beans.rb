class AddRoastToBeans < ActiveRecord::Migration
  def change
    add_column :beans, :roast, :string
  end
end
