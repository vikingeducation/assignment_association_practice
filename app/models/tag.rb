class Tag < ApplicationRecord
  has_many :posts, :through => :posttags
end
