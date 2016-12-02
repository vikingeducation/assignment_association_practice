class CreateJoinTablePostsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :post_users do |t|
      t.integer  "post_id",            null: false
      t.integer  "user_id",            null: false

      t.timestamps
    end
    add_index :post_users, [:post_id, :user_id], unique: true
  end
end
