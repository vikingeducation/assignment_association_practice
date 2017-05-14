class CreateUserPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_posts do |t|
      t.integer :user_id, :null => false
      t.integer :post_id, :null => false

      t.timestamps
    end

    add_index :user_posts,
              [:user_id, :post_id],
              :unique => true
  end
end
