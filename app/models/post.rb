class Post < ApplicationRecord
  has_many :comments, inverse_of: :post
  # ,
                      # :dependent => :destroy
  belongs_to :category, :foreign_key => :category_id
  
  has_many :post_tags
  has_many :tags, :through => :post_tags,
                  # :source => :post,
                  :dependent => :nullify

  has_many :user_posts
  has_many :authors, :through => :user_posts,
                     :source => :user,
                     :dependent => :nullify

  # allows you to do this Post.first.post_authorings - renaming the join table and just saying what class it is
  has_many :post_authorings, :class_name => "UserPost"

  # allows you to do this Post.first.post_taggings - renaming the join table and just saying what class it is
  has_many :post_taggings, :class_name => "PostTag"

  # :reject_if => :all_blank
  # stops a blank form submission actually creating a new object!
  # Can only create or destroy child objects via accept nested attr
  accepts_nested_attributes_for :comments,
                                :reject_if => :all_blank,
                                :allow_destroy => :true
end
