class User < ActiveRecord::Base

  has_many :comments
  has_many :authorships
  has_many :posts, :through => :authorships
end
