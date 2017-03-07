class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :postings, dependent: :nullify
  has_many :users, through: :postings
  has_many :taggings, dependent: :nullify
  has_many :tags, through: :taggings
end
