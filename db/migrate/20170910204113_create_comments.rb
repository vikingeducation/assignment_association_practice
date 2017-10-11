class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user_id, :null => false
      t.integer :post_id, :null => false

      t.timestamps
    end
    add_index :comments, [:user_id, :post_id]
  end
end
