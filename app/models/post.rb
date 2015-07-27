class Post < ActiveRecord::Base
  has_many :comments

  has_many :taggings
  has_many :tags, :through => :taggings

  has_many :authors, :through => :authorships, :foreign_key => :user_id
end
