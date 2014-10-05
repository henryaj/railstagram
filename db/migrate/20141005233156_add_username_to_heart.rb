class AddUsernameToHeart < ActiveRecord::Migration
  def change
    add_column :hearts, :username, :string
  end
end
