class User < ApplicationRecord
	
	has_many :posts
	
	belongs_to :comments
end
