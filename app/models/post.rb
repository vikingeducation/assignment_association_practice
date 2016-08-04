class Post < ApplicationRecord
  has_many :comments
  belongs_to :category, optional: true

  # Many to many with Tags.
  has_many :post_taggings
  has_many :tags, through: :post_taggings


  # Many to many with Posts.
  has_many :post_authorings, class_name: 'UserPost'
  has_many :users, through: :post_authorings
end
