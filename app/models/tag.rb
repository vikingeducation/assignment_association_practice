class Tag < ApplicationRecord
  has_many :post_taggings,
           :class_name => "PostTag"

  has_many :tagged_posts, 
           :through => :post_taggings,
           :source => :post,
           :foreign_key => :post_id

  has_many :authors_of_tagged_posts,
           :through => :tagged_posts,
           :source => :authors

end
