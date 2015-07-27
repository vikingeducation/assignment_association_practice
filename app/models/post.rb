class Post < ActiveRecord::Base
  has_many :comments
  has_many :post_authorings, :class_name => "Authorship"
  has_many :post_taggings, :class_name => "Tagging"
  has_many :tags, :through => :post_taggings

  has_many :authors, :through => :post_authorings, source: :user
end
