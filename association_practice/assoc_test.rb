puts "1. All Users:"
puts Hirb::Helpers::AutoTable.render User.all
user_1 = User.first
user_2 = User.last
comment = user_1.comments.first
puts "2. User 1's comments:"
puts Hirb::Helpers::AutoTable.render user_1.comments
# comment.reload
puts "3. First comment after user change:"
comment.user = user_2
pp comment
post = Post.first
puts "4. Here is a post:"
pp post
post.category = post.category == Category.first ? Category.last : Category.first
puts "We changed the post's category:"
pp post
puts "5. Here are user 2's comments:"
puts Hirb::Helpers::AutoTable.render user_2.comments
user_2.comments = [Comment.first, Comment.second]
puts "We changed user 2's comments:"
pp user_2.comments
puts "6. The user of a given comment:"
pp Comment.first.user
puts "7. Listing a given post's comments:"
puts Hirb::Helpers::AutoTable.render post.comments
puts "8. Returning a given comment's parent post:"
pp comment.post
puts "9. A cateory's posts:"
puts Hirb::Helpers::AutoTable.render Category.first.posts
Category.first.posts.delete(Category.first.posts.last)
puts "We deleted the last post"
puts Hirb::Helpers::AutoTable.render Category.first.posts
puts "10. The posts by a given user"
puts Hirb::Helpers::AutoTable.render user_1.posts
puts "11. IDs of all these posts"
pp user_1.post_ids
puts "12. A user's current posts:"
puts Hirb::Helpers::AutoTable.render user_1.posts
user_1.posts = user_2.posts
puts "We replaced the user's posts:"
puts Hirb::Helpers::AutoTable.render user_1.posts
puts "13. Authors of a post:"
puts Hirb::Helpers::AutoTable.render post.users
puts "14. We changed the post's users"
post.users = [User.second, user_2]
pp post.users
puts "15. We changed the post's users again using IDs"
post.user_ids = [user_1.id, User.all.sample.id]
pp post.users
puts "16. A tag's posts:"
tag = Tag.first
puts Hirb::Helpers::AutoTable.render tag.posts
puts "17. Adding a new post to the tag using IDs"
tagged_post = Post.all.sample
tagged_post = Post.all.sample until !tagged_post.tags.include? tag
Tagging.create(post_id: tagged_post.id, tag_id: tag.id)
tag.reload
puts Hirb::Helpers::AutoTable.render tag.posts
puts "18. A post's tags"
puts Hirb::Helpers::AutoTable.render post.tags
new_tag = Tag.all.sample
new_tag = Tag.all.sample until !post.tags.include? new_tag
Tagging.create(post_id: post.id, tag_id: new_tag.id)
post.reload
puts "19. The tags on a post:"
puts Hirb::Helpers::AutoTable.render post.tags
