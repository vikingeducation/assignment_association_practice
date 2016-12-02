class RemovePostCategoryIndex < ActiveRecord::Migration[5.0]
  def self.up
    remove_index :posts, :category_id
  end

  def self.down
    add_index :posts, :category_id
  end
end
