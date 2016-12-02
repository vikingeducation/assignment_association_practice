class CreatePostsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :posts_users do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
    add_index :posts_users, [:user_id, :post_id], unique: true
  end
end
