class Tag < ActiveRecord::Base

  has_many :post_taggings, :class_name => :PostTag, :dependent => :destroy
  has_many :tagged_posts, :through => :post_taggings, :source => :post
  has_many :post_authorings, :through => :tagged_posts, :source => :post_authorings
  has_many :post_authors, :through => :post_authorings, :source => :user
end

