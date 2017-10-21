class Post < ApplicationRecord

	has_many :post_authorings, :class_name => "UserPost", :dependent => :destroy
	has_many :authors, through: :post_authorings, :class_name => "User", :source => :user


	
	#has_many :category, :foreign_key => :category_id
	has_many :comments, dependent: :destroy
	
	has_many :tags, through: :post_taggings
    has_many :post_taggings, dependent: :destroy
	belongs_to :category

end
