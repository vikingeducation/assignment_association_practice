class Tag < ApplicationRecord

	has_many :taggings, :dependent => :destroy
	has_many :posts, through: :taggings

	has_many :users, 
			 :through => :posts
end