class Post < ApplicationRecord
	has_many :comments, :dependent => :destroy, inverse_of: :post

	accepts_nested_attributes_for :comments,
                                  :reject_if => :all_blank,
                                  :allow_destroy => true
	belongs_to :category
	
	has_many :bloggings
	has_many :users, through: :bloggings

	has_many :taggings, :dependent => :destroy
	has_many :tags, through: :taggings

end