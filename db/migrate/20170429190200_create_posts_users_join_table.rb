class CreatePostsUsersJoinTable < ActiveRecord::Migration[5.0]

  def change
    create_table :posts_users, id: false do |t|

      t.belongs_to :user, index: true
      t.belongs_to :post, index: true
    end
  end

end