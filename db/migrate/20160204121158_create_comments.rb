class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :post_id
      t.index :user_id
      t.index :post_id
      t.timestamps null: false
    end
  end
end
