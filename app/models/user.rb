class User < ApplicationRecord
  has_many :comments
  has_and_belongs_to_many :posts, :join_table => :user_postings
end
