class DropTaggings < ActiveRecord::Migration
  def change
    drop_join_table :tags, :posts, table_name: :taggings
  end
end
