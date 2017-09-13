class Tag < ApplicationRecord
  has_many :post_tags
  has_many :tagged_posts, :through => :post_tags,
                          :source => :tag
end
