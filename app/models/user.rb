class User < ActiveRecord::Base
  
  has_many  :authored_comments,
            class_name: 'Comment',
            :dependent => :destroy
  
  has_many  :post_authorings,
            class_name: 'UserPost'
  
  has_many  :authored_posts,
            :through => :post_authorings,
            :source => :post 

  
  has_many  :post_taggings,
            :through => :post_authorings,
            :source => :post

  
  has_many  :tags_on_authored_posts,
            :through => :post_authorings,
            :source => :post #jointable, source => new association btw user_posts + post_tag
end
