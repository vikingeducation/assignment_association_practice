class CreatePostTags < ActiveRecord::Migration[5.1]
  def change
    create_table :post_tags do |t|
      t.bigint :tag_id
      t.bigint :post_id

      t.timestamps
    end

    add_index :post_tags, [:tag_id, :post_id], unique: true
  end
end
