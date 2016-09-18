class Tag < ApplicationRecord
  has_many :post_taggings,
           :foreign_key => :tag_id,
           :class_name => "PostTag",
           :dependent => :destroy
  has_many :tagged_posts, :through => :post_taggings, :source => :post
end
