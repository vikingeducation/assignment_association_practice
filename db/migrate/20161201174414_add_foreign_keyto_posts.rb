class AddForeignKeytoPosts < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :posts, :categories
  end
end
