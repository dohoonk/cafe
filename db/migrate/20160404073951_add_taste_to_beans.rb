class AddTasteToBeans < ActiveRecord::Migration
  def change
    add_column :beans, :sweet, :integer
    add_column :beans, :fruity, :integer
    add_column :beans, :bitter, :integer
    add_column :beans, :chocolate, :integer
  end
end
