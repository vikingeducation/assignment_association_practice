class Tag < ApplicationRecord

  has_and_belongs_to_many :posts
  has_many :post_taggings, :class_name => "PostsTag"
  has_many :posts_tags
  has_many :tagged_posts, :through => :post_taggings, :source => :post

  has_many :authors_of_tagged_posts,
            :through => :tagged_posts,
            :source => :users

end
