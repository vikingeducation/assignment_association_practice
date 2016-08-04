puts "All Users:"
pp User.all
user_1 = User.first
user_2 = User.last
comment = user_1.comments.first 
puts "User 1's comments:"
pp user_1.comments
comment.reload
puts "First comment after user change:"
pp comment.user = user_2
post = Post.first
puts "Here is a post:"
pp post
post.category = post.category == Category.first ? Category.last : Category.first
puts "We changed the post's category:"
pp post
puts "Here are user 2's comments:"
pp user_2.comments
user_2.comments = [Comment.first, Comment.second]
puts "We changed user 2's comments:"
pp user_2.comments
puts "The user of a given comment:"
pp Comment.first.user
puts "Listing a given post's comments:"
pp post.comments
puts "Returning a given comment's parent post:"
comment.post