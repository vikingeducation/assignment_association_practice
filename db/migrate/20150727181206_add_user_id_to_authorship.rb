class AddUserIdToAuthorship < ActiveRecord::Migration
  def change
    add_column :authorships, :user_id, :integer
  end
end
