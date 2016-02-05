class User < ActiveRecord::Base
  has_many :authored_comments, 
            foreign_key: :author_id, 
            class_name: "Comment",
            dependent: :destroy

  has_many :post_authorings, 
            foreign_key: :author_id,
            class_name: "UserPost",
            dependent: :destroy

  has_many :authored_posts, 
            through: :post_authorings,
            class_name: 'Post',
            source: :post

  has_many :post_taggings, 
            through: :authored_posts

  has_many :tags_on_authored_posts, 
            through: :post_taggings, 
            class_name: 'Tag', 
            source: :tag
end
