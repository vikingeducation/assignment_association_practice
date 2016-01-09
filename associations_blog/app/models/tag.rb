class Tag < ActiveRecord::Base
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags

  has_many :authors_of_tagged_posts, through: :posts, source: :authors
end
