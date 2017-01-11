class Tag < ApplicationRecord
  has_many :post_taggings,
           :foreign_key => :post_id,
           :class_name => 'PostTag', 
           :dependent => :nullify

  has_many :tagged_posts, 
           :through => :post_taggings, 
           :source => :post

  has_many :authors_of_tagged_posts, 
           :through => :tagged_posts, 
           :source => :authors
end
