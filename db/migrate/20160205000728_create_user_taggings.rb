class CreateUserTaggings < ActiveRecord::Migration
  def change
    create_table :user_taggings do |t|

      t.integer :user_id
      t.integer :tag_id

      t.index [ :user_id, :tag_id ]
    end
  end
end
