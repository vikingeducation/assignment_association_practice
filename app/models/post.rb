class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :category

  has_many :user_posts
  has_many :authors,through: :user_posts, source: :user
  has_many :post_authorings, through: :user_posts, source: :user

  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :post_taggings, through: :post_tags, source: :tag

end
