class RenameCommmentsToComments < ActiveRecord::Migration[5.0]
  def change
    rename_table :commments, :comments
  end
end
