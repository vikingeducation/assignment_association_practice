class CreateUserPosts < ActiveRecord::Migration
  def change
    create_table :user_posts do |t|
      t.integer :author_id
      t.integer :post_id

      t.timestamps null: false
    end

    add_index :user_posts, [:author_id, :post_id], unique: true
  end
end
