class AddUserIdToHeart < ActiveRecord::Migration
  def change
    add_column :hearts, :user_id, :integer
  end
end
