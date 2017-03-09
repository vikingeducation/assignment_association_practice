class Post < ApplicationRecord
  has_many :comments, dependent: :destroy, inverse_of: :parent_post
  has_many :post_authorings, class_name: 'UserPosting', :dependent => :destroy
  has_many :authors, :through => :post_authorings, source: :user
  has_many :tags, :through => :post_taggings, :dependent => :destroy
  has_many :post_taggings
  belongs_to :category, optional: true
  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :category

end
