class AddAssociationColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :user_posts, :user_id, :integer
    add_column :user_posts, :post_id, :integer
    add_index :user_posts, [:user_id, :post_id], unique: true
  end
end
