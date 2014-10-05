class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.string :username
      t.integer :post_id

      t.timestamps
    end
  end
end
