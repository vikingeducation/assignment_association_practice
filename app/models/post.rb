class Post < ApplicationRecord
  has_many :post_authorings, class_name: "UserPost", dependent: :destroy
  has_many :authors, through: :post_authorings, source: :user
  has_many :comments, inverse_of: :parent_post,
                      dependent: :destroy
  has_many :post_taggings, class_name: "TagPost", dependent: :destroy
  has_many :tags, through: :post_taggings, source: :tag
  belongs_to :category, optional: true

  accepts_nested_attributes_for :comments,
                                reject_if: :all_blank,
                                allow_destroy: true
end
