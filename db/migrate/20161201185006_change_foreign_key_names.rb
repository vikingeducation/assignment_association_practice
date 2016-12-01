class ChangeForeignKeyNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :user_id, :author_id
    rename_column :post_users, :user_id, :author_id
  end
end
