puts "List a given user's comments"
p User.find(3).comments

puts  "set a comment to belong to a different user"
u = User.find(1)

u.comments.first.update(:user_id => 2)
u_id = u.comments.first.user_id
p u_id 
p u_id == "2"

#4 set a post to be in a different category
