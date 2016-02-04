class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :tags, through: :post_tags
  has_many :authors, through: :user_posts, class_name: "User"
  has_many :post_authorings, :dependent => :destroy, class_name: "UserPost"

  has_many :post_taggings, :dependent => :destroy, class_name: "PostTag"
  belongs_to :category
end
