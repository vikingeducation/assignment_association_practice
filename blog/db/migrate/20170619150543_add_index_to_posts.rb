class AddIndexToPosts < ActiveRecord::Migration[5.0]
  def change
    add_index :posts, :category_id
  end
end
