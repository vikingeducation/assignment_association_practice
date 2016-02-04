class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body

      t.timestamps null: false
      # creates composite key on commentable_id and commentable_type
      t.references :commentable, index: true, polymorphic: true
    end
  end
end
