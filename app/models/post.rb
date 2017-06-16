class Post < ApplicationRecord
  has_many :comments, :dependent => :destroy
  belongs_to :category
  has_and_belongs_to_many :authors, :class_name => "User"
  has_and_belongs_to_many :tags
end
