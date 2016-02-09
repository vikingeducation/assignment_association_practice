class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :post, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
