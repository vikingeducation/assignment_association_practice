class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, inverse_of: :parent_post, dependent: :destroy

  has_many :post_authorings, dependent: :destroy
  has_many :users, through: :post_authorings

  has_many :post_taggings, dependent: :destroy
  has_many :tags, through: :post_taggings

  accepts_nested_attributes_for :comments,
                                reject_if: :all_blank,
                                allow_destroy: true
end
