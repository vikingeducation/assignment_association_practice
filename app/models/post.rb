class Post < ActiveRecord::Base
  has_many :comments
  has_many :user_postings
  has_many :authors, class_name: "User", through: :user_postings
  belongs_to :user
  has_many :post_taggings
  has_many :tags, through: :post_taggings

end
