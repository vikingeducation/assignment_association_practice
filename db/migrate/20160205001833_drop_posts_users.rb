class DropPostsUsers < ActiveRecord::Migration
  def change
    drop_join_table :posts, :users, table_name: :posts_users
  end
end
