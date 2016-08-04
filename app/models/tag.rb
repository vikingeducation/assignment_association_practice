class Tag < ApplicationRecord
  # Many to many with Posts.
  has_many :post_taggings
  has_many :posts, through: :post_taggings
end
