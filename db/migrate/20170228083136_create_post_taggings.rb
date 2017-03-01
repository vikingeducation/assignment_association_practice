class CreatePostTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :post_taggings do |t|
      t.references :post, foreign_key: true, index: true
      t.references :tag, foreign_key: true, index: true

      t.timestamps
    end
  end
end
