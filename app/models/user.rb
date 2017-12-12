class User < ApplicationRecord

  has_many :user_posts, dependent: :destroy
  has_many :posts, through: :user_posts
  # below is the same as ^ but with an alias
  has_many :authored_posts, through: :user_posts, source: :post

  has_many :post_authorings, class_name: 'UserPost', dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :authored_comments, class_name: 'Comment', dependent: :destroy

  has_many :post_taggings, class_name: 'Tagging', through: :authored_posts, dependent: :destroy
  has_many :tags_on_authored_posts, through: :post_taggings, class_name: 'Tag', source: :tag
end
