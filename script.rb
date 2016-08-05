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

count = u.posts.count
u.posts = [Post.find(3), Post.find(4), Post.find(2), Post.find(1)]
p count != u.posts.count

#13 List the authors of a given post
puts "List the authors of a given post"
p = Post.first
p.users.each do |u|
  puts u.name
end

#14 set a collection of users to replace a given post's authors in a similar way
puts "set a collection of users to replace a given post's authors in a similar way"
p = Post.first
count = p.users.count
p.users = [User.find(1)]
p count != p.users.count

#15 Accomplish the same thing only by using IDs
puts "Accomplish the same thing only by using IDs"
p = Post.first
init_arr = p.user_ids
p.user_ids = [3,4,5]
p init_arr != p.user_ids

#16 list the post under a given tag
puts "list the post under a given tag"
p Tag.first.posts.to_a

#17 add a new post to a given tag by only using its ID
puts "add a new tag to a given post by only using its id"

count = Tag.first.posts.count
Tag.first.posts <<  Post.where(:id => 3)
p count != Tag.first.posts.count

#18 add a new tag to a given post by only using its id
puts "add a new tag to a given post by only using its id"
count = Post.first.tags.count
Post.first.tags <<  Tag.where(:id => 4)
p count != Post.first.tags.count

#19 list the tags on a given post
puts "list the tags on a given post"
p Post.first.tags.to_a

#destroying a user should also destroy all of the comments that user authored
puts "destroying a user should also destroy all of the comments that user authored"


#destroying a comment should not destroy its authors or its parent posts
puts "destroying a comment should not destroy its authors or its parent posts"

#destroying a post should destroy all comment on it
puts "destroying a post should destroy all comment on it"

