class CreatePostAuthorings < ActiveRecord::Migration[5.1]
  def change
    create_table :post_authorings do |t|
      t.integer :post_id, foreign_key: true
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
    add_index :post_authorings, [:user_id, :post_id], unique: true
  end
end
