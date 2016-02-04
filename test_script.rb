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










