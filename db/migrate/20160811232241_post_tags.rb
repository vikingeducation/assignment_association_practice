class PostTags < ActiveRecord::Migration[5.0]
  def change
    create_table :post_tags do |t|
      t.integer :tag_id
      t.integer :post_id


      t.timestamps
    end

    add_index :post_tags, [:tag_id, :post_id], :unique => true
  end
end
