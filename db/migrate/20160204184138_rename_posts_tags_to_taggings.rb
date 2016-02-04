class RenamePostsTagsToTaggings < ActiveRecord::Migration
  def change
    rename_table :posts_tags, :taggings
  end
end
