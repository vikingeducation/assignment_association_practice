class Post < ApplicationRecord

  has_many :comments
  belongs_to :category
  has_and_belongs_to_many :users,
                          :join_table => users_comments
  has_and_belongs_to_many :tags,
                          :join_table => posts_tags

end
