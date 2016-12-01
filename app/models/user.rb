class User < ApplicationRecord
  has_many :posts, :through => :userposts
  has_many :comments
end
