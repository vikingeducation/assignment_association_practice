class CreatePostUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :post_users do |t|
    	t.integer :post_id
    	t.integer :user_id

      t.timestamps
    end
    add_index :post_users, [:post_id, :user_id]
  end
end
