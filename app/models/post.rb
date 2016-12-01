class Post < ApplicationRecord
  has_many   :post_authorings, class_name: 'PostUser', dependent: :destroy
  has_many   :post_taggings,   class_name: 'PostTag', dependent: :destroy
  has_many   :comments, dependent: :destroy
  has_many   :tags,    through: :post_tags
  has_many   :authors, through: :post_users, source: :user
  belongs_to :category
end
