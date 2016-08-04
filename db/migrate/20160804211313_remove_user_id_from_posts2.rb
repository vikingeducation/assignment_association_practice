class RemoveUserIdFromPosts2 < ActiveRecord::Migration[5.0]
  def up
    remove_reference :posts, :user
  end

  def down

    add_reference :posts, :user, index: true
    add_foreign_key :posts, :users
  end
end
