class Post < ApplicationRecord
  has_many   :post_authorings, class_name: 'PostUser', dependent: :destroy
  has_many   :post_taggings,   class_name: 'PostTag',  dependent: :destroy
  has_many   :comments, dependent: :destroy, inverse_of: :parent_post
  has_many   :tags,    through: :post_taggings
  has_many   :authors, through: :post_authorings, source: :user
  belongs_to :category, optional: true
  accepts_nested_attributes_for :comments, allow_destroy: true
end
