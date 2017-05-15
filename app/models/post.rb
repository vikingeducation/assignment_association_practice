class Post < ApplicationRecord

  has_many :comments, :dependent => :destroy
  belongs_to :category
  has_and_belongs_to_many :authors, :class_name => "User"
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :users

  has_many :posts_users, :dependent => :destroy
  has_many :post_authorings, :class_name => "PostsUser", :dependent => :destroy

  has_many :post_taggings, :class_name => "PostsTag", :dependent => :destroy

end
