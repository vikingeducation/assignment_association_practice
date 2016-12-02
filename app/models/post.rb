class Post < ApplicationRecord
  belongs_to :category, optional: true

  has_many :post_users, dependent: :destroy
  has_many :authors, through: :post_users, source: :user

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  accepts_nested_attributes_for :tags

  has_many :comments, dependent: :destroy, :inverse_of => :post
  accepts_nested_attributes_for :comments,
                                :reject_if => :all_blank,
                                allow_destroy: :true
end
