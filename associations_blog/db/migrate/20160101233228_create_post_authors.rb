class CreatePostAuthors < ActiveRecord::Migration
  def change
    create_table :post_authors do |t|
      t.references :post, index: true, foreign_key: true
      t.integer :author_id, index: true

      t.timestamps null: false
    end

    add_foreign_key :post_authors, :users, column: :author_id
  end
end
