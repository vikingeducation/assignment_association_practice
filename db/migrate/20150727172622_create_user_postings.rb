class CreateUserPostings < ActiveRecord::Migration
  def change
    create_table :user_postings do |t|

      t.timestamps null: false
    end
  end
end
