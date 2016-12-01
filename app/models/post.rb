class Post < ApplicationRecord
  has_many :users, :through => :userposts
  has_many :comments
  has_many :tags, :through => :posttags
end
