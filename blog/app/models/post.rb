class Post < ApplicationRecord

  has_many :comments,
           dependent: :destroy

  has_many :user_posts,
           dependent: :destroy
  has_many :authors, through: :user_posts, 
           source: :user
  has_many :users, through: :user_posts
  
  has_many :post_tags,
           dependent: :destroy
  has_many :tags, through: :post_tags

  belongs_to :category, optional: true

end



