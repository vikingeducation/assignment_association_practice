class RemoveUserPostsConstraint < ActiveRecord::Migration[5.0]
  def change
    change_column :user_posts, :user_id, :integer, null: true
    change_column :user_posts, :post_id, :integer, null: true
  end
end
