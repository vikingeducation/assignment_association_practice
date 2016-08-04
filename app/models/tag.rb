class Tag < ApplicationRecord
  has_many :post_taggings, class_name: "TagPost"
  has_many :tagged_posts, through: :post_taggings, source: :post
end
