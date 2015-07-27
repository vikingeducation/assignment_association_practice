class User < ActiveRecord::Base
  has_many :authored_comments, 
            class_name: "Comment", 
            dependent: :destroy

  has_many :post_authorings, class_name: "UserPosting"
  has_many :authored_posts,
            through: :post_authorings,
            dependent: :destroy,
            source: :post

  has_many :post_taggings, through: :authored_posts
  has_many :tags_on_authored_posts,
            through: :post_taggings,
            source: :tag
end
