class Tag < ApplicationRecord
	
	has_many :authors_of_tagged_posts, 
			 :through => :tagged_posts,
			 :source  => :authors,
			 :class_name => "User"

	has_many :post_taggings, foreign_key: :tag_id, class_name: "Tagging", :dependent => :destroy
	has_many :taggings, :dependent => :destroy
	has_many :tagged_posts, through: :taggings, :source => :post
end