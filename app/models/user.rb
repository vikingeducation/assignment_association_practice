class User < ApplicationRecord

  has_many :user_posts

  # A)
  has_many :posts, through: :user_posts

  # B)
  # has_many :authored_posts, through: :user_posts_joins, source: :post2

  # A) this works because the assoc name matches the plural of the assoc in the tagging model...
  has_many :taggings, through: :posts

  # B) this renamed association requires using the name of the assoc. declared on the post model
  # has_many :taggings_on_authored_posts, through: :authored_posts, source: :taggings2

  # A) this works because the assoc name matches the name on the tagging class model
  has_many :tags, through: :taggings

  # B) this one uses renamed associations
  # has_many :tags_on_authored_posts, through: :taggings_on_authored_posts, source: :tag2






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
