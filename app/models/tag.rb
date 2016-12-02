class Tag < ApplicationRecord
  has_many :tagged_posts, :through => :posttags, :source => :post
  has_many :post_taggings, :through => :posttags, :source => :post
  has_many :posttags
  has_many :authors_of_tagged_posts, :through => :post_taggings, :source => :authors
end
