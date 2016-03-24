class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :tags, :through => :posts_tags
  has_many :users, :through => :posts_users

end
