puts "\nAll Users\n"
User.all.each { |user| puts "#{user.id} #{user.name}" }

puts "\nAll Comments\n"
Comment.all.each { |comment| puts "#{comment.id} #{comment.body[0..20]}"}

puts "\nAll Posts\n"
Post.all.each { |post| puts "#{post.id} #{post.title}"}

puts "\nAll Categories\n"
Category.all.each { |cat| puts "#{cat.id} #{cat.name}"}

puts "\nAll Tags\n"
Tag.all.each { |t| puts "#{t.id} #{t.name}"}

random_user = User.all.sample
puts "\nUser ID: #{random_user.id}'s Posts'\n"
random_user.posts.each { |post| puts "#{post.id} #{post.title}"}
# SELECT *
# FROM users JOIN user_posts ON users.id=user_id
# JOIN posts ON post_id=posts.id
# WHERE users.id=9

# 3.
c = Comment.all.sample
puts "\ncomment current User ID: #{c.user_id}\n"
c.user_id = User.all.sample.id
puts "\ncomment new User ID: #{c.user_id}\n"


#4.
p = Post.all.sample
puts "\npost current category: #{p.category_id}\n"
p.category_id = Category.all.sample.id
puts "\npost new category: #{p.category_id}\n"

#5.

User.first.comments.each { |comment| puts "#{comment.id} #{comment.body[0..20]}"}
c = [ Comment.all.sample, Comment.all.sample, Comment.all.sample ]
User.first.comments = c
User.first.comments.each { |comment| puts "#{comment.id} #{comment.body[0..20]}"}


#6.
c = Comment.all.sample
puts "\ncomment current user: #{c.user_id}\n"
c.user_id = User.all.sample.id
puts "\ncomment new user: #{c.user_id}\n"

#7.
c = Comment.all.sample
puts "\ncomment current user: #{c.user_id}\n"


#8.
p = Post.all.sample
p.comments.each { |comment| puts "#{comment.id} #{comment.body[0..20]}"}

#9.
c = Comment.all.sample
pp c
# puts "#{c.id} #{c.body[0..20]} #{c.post_id}"
pp c.post

#10.
Category.create(name: "BUBU")

new_post = Post.create(
  title: "RANDOM TITLE",
  body: "JDIFOJSIFJSOD",
  category_id: Category.all.sample.id
)

category = new_post.category
puts "\nCATEGORY #{category.name} POSTS:\n"

puts "NUMBER OF POSTS IN BEFORE DELETE, CATEGORY #{category.name}: #{category.posts.count}"
category.posts.each { |cp| puts "#{cp.id} #{cp.title}"}

new_post.delete

puts "NUMBER OF POSTS AFTER DELETE, CATEGORY #{category.name}: #{category.posts.count}"
category.reload
category.posts.each { |cp| puts "#{cp.id} #{cp.title}"}


#11.
User.all.sample.posts.each { |p| puts "#{p.id} #{p.title}"}

#12.
p User.all.sample.post_ids


#13.

p User.first.posts
User.first.posts = [Post.last, Post.last]
p User.first.posts

#14.

puts "#14"
p = Post.last
p.users.each{ |u| puts "#{u.name}" }

#15

puts "#15"
us = [ User.all.sample, User.all.sample, User.all.sample, User.all.sample ]
p = Post.last
p.users.each{ |u| puts "#{u.name}" }
p.users = us
p.users.each{ |u| puts "#{u.name}" }

#16

puts "#16"
p = Post.last 
print p.user_ids
p.user_ids = [1, 2, 3, 4]
p.reload
print p.user_ids

#17.
puts "#17"
t = Tag.all.sample
t.posts.each { |p| puts "#{p.title}" }

#18
puts "#18"
t = Tag.all.sample
print t.post_ids 
t.posts<< Post.find( Post.all.sample.id )
print t.post_ids 

#19. 
puts "#19"
p = Post.all.sample
print p.tag_ids 
p.tags << Tag.find( Tag.all.sample.id )
print p.tag_ids 

#20

puts "#20"
Post.all.sample.tags.each { |t| puts "#{t.name}" }





