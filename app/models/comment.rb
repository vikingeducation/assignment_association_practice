class Comment < ApplicationRecord
	has_many :users
	belongs_to :post
end
