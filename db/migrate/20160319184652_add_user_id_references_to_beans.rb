class AddUserIdReferencesToBeans < ActiveRecord::Migration
  def change
    add_reference :beans, :user, index: true, foreign_key: true
  end
end
