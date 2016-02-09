class ChangeComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.remove :commentable_id, :commentable_type
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
    end
  end
end
