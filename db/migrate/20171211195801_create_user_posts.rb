class CreateUserPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_posts do |t|
      t.integer :post_id, foreign_key: true
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
    add_index :user_posts, [:user_id, :post_id], unique: true
  end
end
