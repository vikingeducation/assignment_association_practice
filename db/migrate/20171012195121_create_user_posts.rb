class CreateUserPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_posts do |t|
      t.bigint :user_id
      t.bigint :post_id

      t.timestamps
    end

    add_index :user_posts, [:user_id, :post_id], unique: true
  end
end
