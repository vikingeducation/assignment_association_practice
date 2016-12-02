class Post < ApplicationRecord
  belongs_to :category
  has_many :comments

  has_many :post_authorings,
           :class_name => "PostUser",
           :foreign_key => :post_id

  has_many :authors,
           :through => :post_authorings,
           :foreign_key => :post_id,
           :source => :author # Points to what join table belongs to

  has_many :post_taggings,
           :class_name => 'PostTag'

  has_many :tags, :through => :post_taggings
end