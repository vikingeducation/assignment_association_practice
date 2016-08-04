class RenameCommentPostIdToParentPost < ActiveRecord::Migration[5.0]
  def change 
    rename_column :comments, :post_id, :parent_post
  end
end
