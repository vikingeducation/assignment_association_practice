class Post < ApplicationRecord
  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: :true

  has_many :post_authorings, class_name: "UsersPost", foreign_key: :post_id, :dependent => :destroy
  has_many :authors, through: :post_authorings, source: :user

  has_many :post_taggings, class_name: "Tagging", foreign_key: :post_id, :dependent => :destroy
  has_many :tags, through: :post_taggings

  belongs_to :category, optional: true
end
