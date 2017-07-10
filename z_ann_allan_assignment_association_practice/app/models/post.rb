class Post < ApplicationRecord
  has_many :comments, :dependent => :destroy
  belongs_to :category, optional:true
  has_and_belongs_to_many :authors, :class_name => "User"
  has_and_belongs_to_many :tags, optional:true
end
