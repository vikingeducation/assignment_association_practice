class User < ApplicationRecord
	
	has_many :posts, through: :post_users, dependent: :destroy
	has_many :comments, foreign_key: :user_id
	
	
end
