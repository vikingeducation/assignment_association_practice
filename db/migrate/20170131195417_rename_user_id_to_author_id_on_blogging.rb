class RenameUserIdToAuthorIdOnBlogging < ActiveRecord::Migration[5.0]
  def change
  		rename_column :bloggings, :user_id, :author_id
  end
end
