class AddCategoryIdToPost < ActiveRecord::Migration[5.0]
  def change
  		add_column :posts, :category_id, :integer
  		add_index :posts, :category_id, :unique => true
  end
end
