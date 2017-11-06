class RenamePostTagToPostTagging < ActiveRecord::Migration[5.1]
  def change
    rename_table :post_tags, :post_taggings
  end
end
