Category.all
User.all
Comment.all
Post.all
Tag.all
User.last.comments

def change_comment
  until comment
    comment = User.all.sample.comment[0]
  end
  comment.user_id = rand(User.first.id..User.last.id) 
  comment.save!
end

def change_category_for_post
  c = Category.first
  c.post_id =  rand(Post.first.id..Post.last.id)
  c.save!
end

User.second.comments = [Comment.first, Comment.last]
