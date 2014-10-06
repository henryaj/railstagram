class RemoveUsernameFromHearts < ActiveRecord::Migration
  def change
    remove_column :hearts, :username, :string
  end
end
