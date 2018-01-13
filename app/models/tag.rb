class Tag < ApplicationRecord

  has_many :post_tags, dependent: :destroy 
  has_many :tagged_posts, through: :post_tags, source: :post
  has_many :authors_of_tagged_posts, :through => :tagged_posts, :source => :authors

end
