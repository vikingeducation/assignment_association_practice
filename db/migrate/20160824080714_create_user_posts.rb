class CreateUserPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_posts do |t|
      t.integr :user_id, :null => false
      t.integr :post_id, :null => false
      t.timestamps
    end
    add_index :user_posts, :user_id
    add_index :user_posts, :post_id
  end
end
