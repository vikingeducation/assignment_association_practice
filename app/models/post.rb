class Post < ActiveRecord::Base
  has_many :post_authorings, class_name: "Authoring", :dependent => :destroy
  has_many :authors, through: :post_authorings, source: :user

  has_many :post_taggings, class_name: "Tagging", dependent: :destroy
  has_many :tags, through: :post_taggings

  has_many :comments, dependent: :destroy
end
