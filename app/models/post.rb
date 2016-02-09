class Post < ActiveRecord::Base

  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :post_authorings, class_name: "PostsUser", dependent: :destroy
  has_many :authors, through: :post_authorings
  has_many :post_taggings, class_name: "Tagging"
  has_many :tags, through: :post_taggings, dependent: :destroy


  accepts_nested_attributes_for :comments, :reject_if => :all_blank, :allow_destroy => :true

end
