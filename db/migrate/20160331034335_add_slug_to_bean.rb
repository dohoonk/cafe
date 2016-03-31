class AddSlugToBean < ActiveRecord::Migration
  def change
    add_column :beans, :slug, :string
    add_index :beans, :slug
  end
end
