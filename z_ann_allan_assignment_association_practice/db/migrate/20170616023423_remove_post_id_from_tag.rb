class RemovePostIdFromTag < ActiveRecord::Migration[5.0]
  def change
    remove_column :tags, :post_id, :integer
  end
end
