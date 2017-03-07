class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :postings, dependent: :destroy
  has_many :posts, through: :postings
  has_many :tags, through: :posts
end
