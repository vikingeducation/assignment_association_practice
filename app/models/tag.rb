class Tag < ApplicationRecord
  has_many :posts,
           :through => :post_tags,
           :dependent => :destroy
end
