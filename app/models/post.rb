class Post < ActiveRecord::Base
  has_many :authorings
  has_many :users, through: :authorings

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :comments
end
