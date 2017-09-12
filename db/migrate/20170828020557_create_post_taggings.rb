class CreatePostTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :post_taggings do |t|
      t.references :post, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end

    add_index :post_taggings, [:post_id, :tag_id], unique: true
  end
end
