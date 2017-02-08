class RevertBackAuthorIdToUserId < ActiveRecord::Migration[5.0]
  def change
  		rename_column :bloggings, :author_id, :user_id
  		rename_column :comments, :author_id, :user_id
  end
end
