class Post < ApplicationRecord
  belongs_to :category

  has_many :comments, dependent: :destroy, inverse_of: :post
  has_many :postings, dependent: :destroy
  has_many :users, through: :postings
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  accepts_nested_attributes_for :comments
end
