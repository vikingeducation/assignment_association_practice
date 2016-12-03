puts "USERS"
puts Hirb::Helpers::AutoTable.render User.all
puts "POSTS"
puts Hirb::Helpers::AutoTable.render Post.all
puts "TAGS"
puts Hirb::Helpers::AutoTable.render Tag.all
puts "CATEGORIES"
puts Hirb::Helpers::AutoTable.render Category.all
puts "COMMENTS"
puts Hirb::Helpers::AutoTable.render Comment.all

random_comment = Comment.all.sample
puts "Lucky comment of the day is ##{random_comment.id}. Former author: #{random_comment.user.name}."
random_comment.user = User.all.sample
random_comment.save
puts "New author: #{random_comment.user.name}."

random_post = Post.all.sample
puts "Lucky post of the day is ##{random_post.id}. Old category: #{random_post.category.name}."
random_post.category = Category.all.sample
puts "New category: #{random_post.category.name}."
puts "Post's comments:"
puts Hirb::Helpers::AutoTable.render random_post.comments

random_user = User.all.sample
puts "Comments of user #{random_user.name}:"
puts Hirb::Helpers::AutoTable.render random_user.comments
puts "New comments of user:"
random_user.comments << [Comment.first, Comment.second]
random_user.save

puts Hirb::Helpers::AutoTable.render random_user.comments

random_comment = Comment.all.sample
puts "Lucky comment of the day is ##{random_comment.id}. Its author is #{random_comment.user.name}. Its parent post is ##{random_comment.post.id}."
