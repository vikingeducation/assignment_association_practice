class Post < ApplicationRecord
  has_many :comments
  has_many :users
  has_many :tags
  belongs_to :category
end
