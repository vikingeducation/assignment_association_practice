class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :category
  has_many :tags, through: :taggings
  has_many :authors, through: :user_posts, :source => :user 
  has_many :post_authorings, class_name: "UserPost", dependent: :delete_all
  has_many :post_taggings, class_name: "Tagging"
end
