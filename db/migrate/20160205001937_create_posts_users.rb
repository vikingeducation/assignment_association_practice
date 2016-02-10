class CreatePostsUsers < ActiveRecord::Migration
  def change
    create_table :posts_users do |t|
      t.references :post, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
