class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, index: true, foreign_key: true
      t.integer :author_id, index: true
      t.string :body

      t.timestamps null: false
    end

    add_foreign_key :comments, :users, column: :author_id
  end
end
