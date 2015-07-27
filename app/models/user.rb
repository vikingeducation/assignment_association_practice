class User < ActiveRecord::Base
  has_many :authorings
  has_many :posts, through: :authorings

  has_many :comments
end
