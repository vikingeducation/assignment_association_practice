class Post < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :postings
  has_many :users, through: :postings
  has_many :taggings
  has_many :tags, through: :taggings
end
