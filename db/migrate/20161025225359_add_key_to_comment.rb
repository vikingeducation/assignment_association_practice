class AddKeyToComment < ActiveRecord::Migration
  def change
    add_foreign_key :users, :comments
  end
end
