class RenameUserPostToPostAuthoring < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_posts, :post_authorings
  end
end
