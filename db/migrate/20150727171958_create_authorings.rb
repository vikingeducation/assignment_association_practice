class CreateAuthorings < ActiveRecord::Migration
  def change
    create_table :authorings do |t|
      t.references :user
      t.references :post
      t.timestamps null: false
    end
  end
end
