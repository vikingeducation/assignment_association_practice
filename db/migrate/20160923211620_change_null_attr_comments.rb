class ChangeNullAttrComments < ActiveRecord::Migration[5.0]
  def change
    change_column :comments, :user_id, :integer, :null => true
  end
end
