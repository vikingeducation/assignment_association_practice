class CreatePostTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :post_taggings do |t|
    	t.integer :post_id
    	t.integer :tag_id

      t.timestamps
    end
  end
end
