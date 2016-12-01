class Post < ApplicationRecord
    has_many :comments
    has_many :users, :foreign_key => :author_id
    has_many :post_tags
    has_many :tags, :through => :post_tags
end
