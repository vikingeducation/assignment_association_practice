class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy, inverse_of: :post
  accepts_nested_attributes_for :comments, :reject_if => :all_blank, :allow_destroy => true

  belongs_to :category

  has_many :user_posts
  has_many :authors, through: :user_posts, source: :user

  has_many :post_tags
  has_many :tags, through: :post_tags
end
