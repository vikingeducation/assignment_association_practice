class AddCategoryReferencesToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :category
    add_foreign_key :posts, :categories
  end
end
