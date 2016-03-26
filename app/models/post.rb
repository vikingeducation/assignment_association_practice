class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments

  has_many :post_authorings, :class_name => "PostUser"
  has_many :authors, :through => :post_users, :source => :user

  has_many :post_tags
  has_many :tags, through: :post_tags

end

