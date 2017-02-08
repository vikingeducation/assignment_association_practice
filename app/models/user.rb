class User < ApplicationRecord
	has_many :comments, :dependent => :destroy
	has_many :bloggings, :dependent => :destroy
	has_many :posts, :through => :bloggings
	has_many :tags, 
			 :through => :posts
end