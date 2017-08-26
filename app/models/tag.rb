class Tag < ApplicationRecord
	has_many :post_taggings, dependent: :destroy
	has_many :posts, through: :post_taggings
end
