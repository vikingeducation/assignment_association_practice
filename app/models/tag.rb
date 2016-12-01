class Tag < ApplicationRecord
  has_many :posts, :through => :posttags
  has_many :posttags
end
