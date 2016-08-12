class Post < ApplicationRecord

  has_many :comments, :dependent => :destroy
  belongs_to :category

  has_many :post_taggings, :class_name => "PostTag", :dependent => :delete_all
  has_many :tags, :through => :post_taggings


  has_many :user_posts, :dependent => :delete_all
  has_many :authors, :through => :user_posts, :source => :user

end
