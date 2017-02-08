class RemoveUniqueIndexComment < ActiveRecord::Migration[5.0]
  def change
  	remove_index :comments, :user_id
  	add_index :comments, :user_id
  	remove_index :comments, :post_id
  	add_index :comments, :post_id
  end
end
