class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :user_id, :integer
    add_column :posts, :category_id, :integer
    add_column :comments, :post_id, :integer
  end
end
