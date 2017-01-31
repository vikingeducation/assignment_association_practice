class User < ApplicationRecord
	has_many :authored_comments, :foreign_key => :author_id, :source => :comments
	has_many :bloggings
	has_many :posts, through: :bloggings
end
