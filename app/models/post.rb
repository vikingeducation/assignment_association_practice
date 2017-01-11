class Post < ApplicationRecord
  has_many :comments,
           :dependent => :destroy
  
  belongs_to :category

  has_many :post_taggings, 
           :foreign_key => :post_id,
           :class_name => 'PostTag',
           :dependent => :nullify
           
  has_many :tags, :through => :post_taggings

  has_many :post_authorings,
           :foreign_key => :user_id,
            class_name: "UserPost",
            :dependent => :nullify

  has_many :authors, 
           :through => :post_authorings,
           :source => :user
end
