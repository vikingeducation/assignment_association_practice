class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, through: :post_tags
  has_many :tagged_posts, through: :post_tags, source: :post
  has_many :post_taggings, through: :post_tags, source: :post 
end
