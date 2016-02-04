class PostTag < ActiveRecord::Base
  has_many :posts
  has_many :tags

  validates :post_id, :uniqueness => { :scope => :tag_id }
end
