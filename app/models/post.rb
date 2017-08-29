class Post < ApplicationRecord
  belongs_to :category

  has_many :comments, dependent: :destroy

  has_many :post_authorings, class_name: "UserPosting"
  has_many :authors, through: :post_authorings, source: :user, dependent: :nullify

  has_many :post_taggings, class_name: "PostTagging"
  has_many :tags, through: :post_taggings, dependent: :nullify
end
