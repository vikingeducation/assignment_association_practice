class Post < ApplicationRecord
  has_many   :post_authorings, class_name: 'PostUser', dependent: :destroy
  has_many   :post_taggings,   class_name: 'PostTag',  dependent: :destroy
  has_many   :comments, dependent: :destroy
  has_many   :tags,    through: :post_taggings
  has_many   :authors, through: :post_authorings, source: :user
  belongs_to :category

  validates :category_id, presence: true, allow_nil: true
end
