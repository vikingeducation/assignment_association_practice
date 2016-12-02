class RenamePostsUsersToPostUsers < ActiveRecord::Migration[5.0]
  def change
    rename_table :posts_users, :post_users
  end
end
