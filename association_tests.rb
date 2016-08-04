require 'hirb'

Hirb.enable
# puts Hirb::Helpers::AutoTable.render([1,2,3,4])

puts "\n1a. here lie users"
puts Hirb::Helpers::AutoTable.render(User.all)

puts "\n\n1b. here lie posts"
puts Hirb::Helpers::AutoTable.render(Post.all)

puts "\n\n1c. here lie comments"
puts Hirb::Helpers::AutoTable.render(Comment.all)

puts "\n\n1d. here lie tags"
puts Hirb::Helpers::AutoTable.render(Tag.all)

puts "\n\n1e. here lie categories"
puts Hirb::Helpers::AutoTable.render(Category.all)

puts "\n\n2. listing user comments"
puts Hirb::Helpers::AutoTable.render(User.first.authored_comments)

puts "\n\n3. set comment to different user"
x = Comment.first.user_id
puts "Comments user id before: #{x}"
x = User.all.sample.id
puts "Comments user id after: #{x}"

puts "\n\n4. set a post to be in a different category"
post = Post.first.category_id
puts "Post category id before: #{post}"
post = Category.all.sample.id
puts "Post category id after: #{post}"

puts "\n\n5. replace a user's comments with new collection of comments"
user_comms = User.first.authored_comments
print "User comment ids before: "
user_comms.each {|comment| print " #{comment.id},"}
user_comms = [Comment.first, Comment.second]
print "\nUser comment ids after: "
user_comms.each {|comment| print " #{comment.id},"}
puts "\n"

puts "\n\n6. Return a given comment's author"
comm_author = Comment.first.author
puts "#{comm_author.name}"

puts "\n\n7. List a given post's comments"
post_comms = Post.first.comments
puts Hirb::Helpers::AutoTable.render(post_comms)

puts "\n\n8. Return a given comment's parent post"
parent = Comment.first.parent_post
puts Hirb::Helpers::AutoTable.render(parent)

puts "\n\n9. Remove one post from a category's collection of posts"
cat_posts = Category.third.posts
puts "\nPosts for category: "
puts Hirb::Helpers::AutoTable.render(cat_posts)
post_tainer = cat_posts.delete(cat_posts.last)
puts "\nPosts for category after deleting last one"
puts Hirb::Helpers::AutoTable.render(cat_posts)
cat_posts << post_tainer

puts "\n\n10. List the posts authored by a given user\n"
posts_by_author = User.second.authored_posts
puts Hirb::Helpers::AutoTable.render(posts_by_author)

puts "\n\n11. List the IDs of all posts authored by a given user (hint: there's an association method for this)\n"
post_ids_by_author = User.second.authored_post_ids
puts Hirb::Helpers::AutoTable.render(post_ids_by_author)

puts "\n\n12. Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]"
puts "\nUsers post before changing collection"
puts Hirb::Helpers::AutoTable.render(User.first.posts)
puts "\nUser posts after changing collection"
user_posts = User.first.posts
user_posts = [Post.first, Post.second]
puts Hirb::Helpers::AutoTable.render(user_posts)

puts "\n\n13. List the authors of a given post"
puts "Post author(s)"
puts Hirb::Helpers::AutoTable.render(Post.first.users)

puts "\n\n14. Set a collection of Users to replace a given Post's authors in a similar way"
puts "Author collection before:"
post = Post.first
puts Hirb::Helpers::AutoTable.render(post.users)
post.users = [User.first, User.second]
post.save
puts "\nAuthor collection after:"
puts Hirb::Helpers::AutoTable.render(Post.first.users)

puts "\n\n15. Accomplish the same thing by only using IDs (hint: there's an association method for this...)"
puts "Author collection before:"
post = Post.first
puts Hirb::Helpers::AutoTable.render(post.user_ids)
post.user_ids = [User.second.id, User.third.id]
post.save
puts "\nAuthor collection after:"
puts Hirb::Helpers::AutoTable.render(Post.first.user_ids)

puts "\n\n16. List the posts under a given tag"
tag = Tag.first
puts "Posts under tag 1"
puts Hirb::Helpers::AutoTable.render(tag.posts)

puts "\n\n17. Add a new post to a given tag by only using its ID"
tag = Tag.first
puts "Posts under tag 1 before"
puts Hirb::Helpers::AutoTable.render(tag.post_ids)
postses = Post.all[0..4].map(&:id)
tag.post_ids =  postses
tag.save
puts "\nPosts under tag 1 after"
puts Hirb::Helpers::AutoTable.render(tag.post_ids)

puts "\n\n18. Add a new tag to a given post by only using its ID"
post = Post.last
puts "Tags on last post"
puts Hirb::Helpers::AutoTable.render(post.tag_ids)
post.tag_ids = Tag.first.id
post.save
puts "\nTags under last post after"
puts Hirb::Helpers::AutoTable.render(Post.last.tag_ids)

puts "\n\n19. List the tags on a given post"
post = Post.first
puts "Tags on first post"
puts Hirb::Helpers::AutoTable.render(post.tags)
