class User < ApplicationRecord
  has_many :comments
  has_many :postings
  has_many :posts, through: :postings
end
