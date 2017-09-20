class Post < ApplicationRecord
  has_many :comments , :dependent => :destroy
  belongs_to :category, :foreign_key => :category_id
  
  has_many :post_tag
  has_many :tags, :through => :post_tags,
                  # :source => :post
                  :dependent => :nullify

  has_many :user_posts
  has_many :authors, :through => :user_posts,
                     :source => :user,
                     :dependent => :nullify

  # allows you to do this Post.first.post_authorings - renaming the join table and just saying what class it is
  has_many :post_authorings, :class_name => "UserPost"

  # allows you to do this Post.first.post_taggings - renaming the join table and just saying what class it is
  has_many :post_taggings, :class_name => "PostTag"


end
