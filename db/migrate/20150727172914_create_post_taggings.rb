class CreatePostTaggings < ActiveRecord::Migration
  def change
    create_table :post_taggings do |t|

      t.timestamps null: false
    end
  end
end
