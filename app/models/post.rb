class Post < ApplicationRecord

  has_many :comments
  belongs_to :category

  has_and_belongs_to_many :tags,
        :join_table => :post_tags

  

  has_and_belongs_to_many :authors, :class_name => "User",
        # :foreign_key => :user_id,
        :join_table => :user_posts
end
