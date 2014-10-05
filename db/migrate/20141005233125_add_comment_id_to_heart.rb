class AddCommentIdToHeart < ActiveRecord::Migration
  def change
    add_column :hearts, :comment_id, :integer
  end
end
