class User < ApplicationRecord

  has_and_belongs_to_many :posts,
                          :join_table => users_comments
  has_many :comments

end
