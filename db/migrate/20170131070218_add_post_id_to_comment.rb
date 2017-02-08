class AddPostIdToComment < ActiveRecord::Migration[5.0]
  def change
  		add_column :comments, :post_id, :integer
  		add_index :comments, :post_id, :unique => true
  end
end
