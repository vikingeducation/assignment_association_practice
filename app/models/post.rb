class Post < ApplicationRecord
	
	has_many :users, through: :post_users, dependent: :destroy
	
	has_many :categories
	has_many :comments, dependent: :destroy
	
	has_many :post_taggings, dependent: :destroy
	has_many :tags, through: :post_taggings

end
