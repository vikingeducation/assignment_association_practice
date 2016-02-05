class Post < ActiveRecord::Base
  has_many :comments

  belongs_to :category

  has_many :post_taggings, foreign_key: :post_id, class_name: "PostTag"
  has_many :tags, :through => :post_taggings


  has_many :post_authorings, foreign_key: :post_id, class_name: "UserPost"

  has_many :authors, :through => :user_posts, foreign_key: :user_id, source: :user
end
