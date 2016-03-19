class AddUserReferencesToCafes < ActiveRecord::Migration
  def change
    add_reference :cafes, :user, index: true, foreign_key: true
  end
end
