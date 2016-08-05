class Post < ApplicationRecord

  has_many :post_authorings, class_name: "UsersPost", foreign_key: :post_id, :dependent => :destroy
  has_many :authors, through: :post_authorings, source: :user

  has_many :post_taggings, class_name: "Tagging", :dependent => :destroy
  has_many :tags, through: :post_taggings

  belongs_to :category

  has_many :comments, :dependent => :destroy, inverse_of: :parent_post
  accepts_nested_attributes_for :comments,
                                :reject_if => :all_blank,
                                :allow_destroy => true
end
