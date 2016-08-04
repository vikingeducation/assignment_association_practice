puts "List a given user's comments"
p User.find(3).comments

puts  "set a comment to belong to a different user"
u = User.find(1)
u.comments.first.update( :user_id => 2 )
u_id = u.comments.first.user_id
p  u_id == 2

#4 set a post to be in a different category
post = Post.where(category_id: 1).first
post.category = Category.find(2)
puts post.category.id != 1

#5 set a collection of comments to replace a current user's comments
current_count = User.first.comments.count
User.first.comments = [Comment.first, Comment.second]
new_count = User.first.comments.count
puts current_count != new_count

#6 return a given comment's author
puts User.first.comments.first.user.name

#7 list a given post's commments
Post.first.comments.each do |c|
  puts c.body
end

#8 return a given comment's parent post
c = Comment.first
puts c.post.title

#9 remove one post from a category's collection of posts
# current_count = Category.first.posts.count
# Category.first.posts.destroy(Category.first.posts.first)
# new_count = Category.first.posts.count
# puts current_count != current_count

#10 List the posts authored by a given user
user = User.first

puts "List the posts authored by a given user"
user.posts.each do |p|
  puts p.body
end

#11 List the IDs of all posts authored by a given user
puts "List the IDs of all posts authored by a given user"
User.first.post_ids

#12 Set a collection of Posts to replace that user's currently authored posts
puts "Set a collection of Posts to replace that user's currently authored posts"
u = User.first

posts = []
2.times do | i |
  posts.push Post.create!({title: "new_post_#{i}"})
end