class CreateHearts < ActiveRecord::Migration
  def change
    create_table :hearts do |t|

      t.timestamps
    end
  end
end
