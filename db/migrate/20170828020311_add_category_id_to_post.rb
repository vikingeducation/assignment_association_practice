class AddCategoryIdToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :category
  end
end
