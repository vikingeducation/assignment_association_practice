class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text      :body
      t.integer   :user_id, null: false
      t.integer   :post_id, null: false

      t.index     :user_id
      t.index     :post_id

      t.timestamps null: false
    end
  end
end
