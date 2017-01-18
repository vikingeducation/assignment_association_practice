class RenameColumnInPostTags < ActiveRecord::Migration[5.0]
  def change
    rename_column :post_tags, :user_id, :tag_id
  end
end
