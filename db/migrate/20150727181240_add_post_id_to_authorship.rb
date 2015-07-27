class AddPostIdToAuthorship < ActiveRecord::Migration
  def change
    add_column :authorships, :post_id, :integer
  end
end
