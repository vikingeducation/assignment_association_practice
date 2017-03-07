class CreatePostings < ActiveRecord::Migration[5.0]
  def change
    create_table :postings do |t|
      t.belongs_to :post
      t.belongs_to :user
    end
  end
end
