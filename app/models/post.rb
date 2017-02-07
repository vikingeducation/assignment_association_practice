class Post < ApplicationRecord
	has_many :comments, :dependent => :destroy
	belongs_to :category
	
	has_many :post_authorings, class_name: "Blogging", :dependent => :destroy
	has_many :authors, through: :post_authorings, class_name: "User"

	has_many :post_taggings, foreign_key: :post_id, class_name: "Tagging", :dependent => :destroy
	has_many :taggings, :dependent => :destroy
	has_many :tags, through: :taggings

end
