class Tag < ApplicationRecord
  has_many :post_taggings
  has_many :posts, :through => :post_taggings
end
