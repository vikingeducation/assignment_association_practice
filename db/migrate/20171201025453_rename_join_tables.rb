class RenameJoinTables < ActiveRecord::Migration[5.0]
  def change
    rename_table :posts_tags, :post_tags
    rename_table :users_posts, :user_posts
  end
end
