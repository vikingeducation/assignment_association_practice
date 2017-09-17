class Post < ApplicationRecord
	
	has_many :authors, through: :post_users, dependent: :destroy, :source => :users
	
	has_many :categories
	has_many :comments, dependent: :destroy
	
	has_many :tags, through: :post_taggings
    has_many :post_taggings, dependent: :destroy
	

end
