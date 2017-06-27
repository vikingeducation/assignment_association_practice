class User < ApplicationRecord
  
  before_destroy :delete_user_dependencies

  has_many :comments, 
           foreign_key: :author_id,
           dependent: :destroy

  has_many :user_posts,
           dependent: :destroy
  has_many :posts, through: :user_posts

private

def delete_user_dependencies 
  # activated before deleting user ... not tested
  # destroy associated user_posts 
  # but if a user post has no other author, destroy the post as well
  posts = User.first.posts
  posts.each do |post|
    unless post.users.count == 1 # ie, post has other authors
      User.first.user_posts.where("user_id =? and post_id = ?", User.id, post.id).destroy
    else # ie, post has only this author
      post.destroy # will destroy dependent user_post at same time
    end
  end


end




class Author < User

end



  
end
