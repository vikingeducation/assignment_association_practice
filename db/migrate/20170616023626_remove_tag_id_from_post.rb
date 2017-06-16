class RemoveTagIdFromPost < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :tag_id, :integer
  end
end
