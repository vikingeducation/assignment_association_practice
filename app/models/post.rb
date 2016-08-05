class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :category, optional: true

  # Many to many with Tags.
  has_many :post_taggings, dependent: :destroy
  has_many :tags, through: :post_taggings,
                           dependent: :nullify


  # Many to many with Posts.
  has_many :post_authorings, class_name: 'UserPost', 
                             dependent: :destroy
  has_many :users, through: :post_authorings
end
