class Tag < ApplicationRecord
  has_many :post_taggings,
    :class_name => "PostTag",
    :dependent => :destroy
  has_many :tagged_posts,
    :through => :post_taggings,
    :source => :post
  has_many :authored_posts,
    :through => :tagged_posts,
    :source => :post_authorings
  has_many :authors_of_tagged_posts,
    :through => :authored_posts,
    :source => :user
end
