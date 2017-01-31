class Post < ApplicationRecord
	has_many :comments
	belongs_to :category
	has_many :taggings
	has_many :tags, through: :taggings
	has_many :bloggings
	has_many :users, through: :bloggings
end
