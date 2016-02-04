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
