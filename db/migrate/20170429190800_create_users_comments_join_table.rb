class CreateUsersCommentsJoinTable < ActiveRecord::Migration[5.0]

  def change
    create_table :users_comments, id: false do |t|

      t.belongs_to :user, index: true
      t.belongs_to :comment, index: true
    end

  end

end