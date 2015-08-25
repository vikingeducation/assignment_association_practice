class AddPostIdToTaggings < ActiveRecord::Migration
  def change
    add_column :taggings, :post_id, :integer
  end
end
