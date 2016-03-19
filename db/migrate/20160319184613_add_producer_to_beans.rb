class AddProducerToBeans < ActiveRecord::Migration
  def change
    add_column :beans, :producer, :string
  end
end
