class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, :dependent => :destroy

  has_many :post_authorings,
           :class_name => "PostUser",
           :foreign_key => :post_id,
           :dependent => :destroy

  has_many :authors,
           :through => :post_authorings,
           :foreign_key => :post_id,
           :source => :author # Points to what join table belongs to

  has_many :post_taggings,
           :class_name => 'PostTag',
           :dependent => :destroy # removing full row? 

  has_many :tags, :through => :post_taggings
end