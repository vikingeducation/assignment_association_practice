class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.references :category
      
      t.timestamps null: false
    end
  end
end
