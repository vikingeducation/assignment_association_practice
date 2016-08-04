class CreateUserPosts < ActiveRecord::Migration
  def change
    create_table :user_posts do |t|
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps null: false
    end
  end
end
