class AddIndexToUsernameToPosts < ActiveRecord::Migration
  def change
    add_index :posts, :username
  end
end
