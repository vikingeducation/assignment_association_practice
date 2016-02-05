class User < ActiveRecord::Base
  has_many :authored_comments, foreign_key: :user_id, class_name: "Comment"


  has_many :post_authorings, foreign_key: :user_id, class_name: "UserPost"

  has_many :authored_posts, :through => :user_posts, foreign_key: :user_id, source: :post

  # has_and_belongs_to_many :tags_on_authored_posts, foreign_key: :user_id, join_table: :user_taggings, source: :tag

    
  has_many :tags_on_authored_posts, through: :authored_posts, source: :tags

end
