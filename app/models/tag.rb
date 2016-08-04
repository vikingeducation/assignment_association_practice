class Tag < ActiveRecord::Base
  has_many :post_taggings, class_name: "PostTag", dependent: :destroy
  has_many :tagged_posts, source: :post, through: :post_taggings
  has_many :authors_of_tagged_posts, source: :authors, through: :tagged_posts
end
