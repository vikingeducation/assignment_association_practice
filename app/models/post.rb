class Post < ApplicationRecord
	has_many :comments, :dependent => :destroy

	accepts_nested_attributes_for :comments,
                                  :reject_if => :all_blank,
                                  :allow_destroy => true
	belongs_to :category
	
	has_many :bloggings
	has_many :post_authorings, class_name: "Blogging", :dependent => :destroy
	has_many :authors, through: :bloggings, class_name: "User"

	has_many :post_taggings, foreign_key: :post_id, class_name: "Tagging", :dependent => :destroy
	has_many :taggings, :dependent => :destroy
	has_many :tags, through: :taggings

end
