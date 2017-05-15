class Tag < ApplicationRecord

  has_and_belongs_to_many :posts
  has_many :post_taggings, :class_name => "PostsTag", :dependent => :destroy
  has_many :posts_tags, :dependent => :destroy
  has_many :tagged_posts, :through => :post_taggings, :source => :post
  
  has_many :authors_of_tagged_posts,
            :through => :tagged_posts,
            :source => :users

  # has_many :posts_users, :through => :posts_tags, :source => :post_authorings
  # has_many :authors_of_tagged_postsqw, :through => :posts_users, :class_name => 'User', :source => :user

end
