class Post < ApplicationRecord
	
	belongs_to :users, optional: true
	
	has_many :categories
	has_many :comments

end
