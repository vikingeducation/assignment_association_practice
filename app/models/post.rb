class Post < ApplicationRecord
  has_many :users, :through => :userposts
  has_many :userposts
  has_many :comments
  has_many :tags, :through => :posttags
  has_many :posttags
end
