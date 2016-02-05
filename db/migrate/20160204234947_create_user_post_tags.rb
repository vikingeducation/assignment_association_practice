class CreateUserPostTags < ActiveRecord::Migration
  def change
    create_table :user_post_tags do |t|
      t.integer :user_post_id
      t.integer :post_tag_id

      t.timestamps null: false
    end
  end
end
