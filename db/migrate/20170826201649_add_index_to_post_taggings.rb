class AddIndexToPostTaggings < ActiveRecord::Migration[5.0]
  def change
  	add_index :post_taggings, [:tag_id, :post_id]
  end
end
