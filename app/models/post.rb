class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments

  has_many :post_authorings, :class_name => :PostUser
  has_many :authors, :through => :post_authorings, :source => :user

  has_many :post_taggings, :class_name => :PostTag
  has_many :tags, :through => :post_taggings

end

# The tag join table
# Tag.first.post_taggings
# Post.first.post_taggings

