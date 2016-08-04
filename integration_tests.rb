require 'hirb'
  
def f(table)
  puts Hirb::Helpers::AutoTable.
  render(table)
end

# 1
puts "1. List all Users, Comments, Posts, Categories or Tags."
puts Hirb::Helpers::AutoTable.
  render(User.all.to_a)
puts Hirb::Helpers::AutoTable.
  render(Comment.all.to_a)
puts Hirb::Helpers::AutoTable.
  render(Post.all.to_a)
puts Hirb::Helpers::AutoTable.
  render(Category.all.to_a)
puts Hirb::Helpers::AutoTable.
  render(Tag.all.to_a)

# 2
puts "2. List a given user's comments"
puts Hirb::Helpers::AutoTable.
  render(User.all.sample.comments)

# 3
puts "3. Set a comment to belong to a different user"
comment = User.first.comments.sample
puts Hirb::Helpers::AutoTable.
  render(User.last.comments << comment)

#4
puts "4. Set a post to be in a different category"
category = Category.all.sample
puts Hirb::Helpers::AutoTable.
  render(Post.all.sample.category = category)

#5
puts "5. Set a collection of comments to replace a user's current comments"
comments = Comment.all.sample(3)
puts Hirb::Helpers::AutoTable.
  render(User.first.comments = comments)

#6
puts "Return a given comment's author"
puts Hirb::Helpers::AutoTable.
  render(Comment.all.sample.user)

#7
puts "List a given post's comments"
puts Hirb::Helpers::AutoTable.
  render(Post.all.sample.comments.all)

#8
puts "8. Return a given comment's parent post"
puts Hirb::Helpers::AutoTable.
  render(Comment.all.sample.post)

#9
puts "9. Remove one post from a category's collection of posts"
puts "Category before post deleted"
puts Hirb::Helpers::AutoTable.
  render(category_posts = Category.all.sample.posts)
  puts "Post that's been deleted"
puts Hirb::Helpers::AutoTable.
  render(category_posts.delete(category_posts.first))
  puts "Category after post deleted"
puts Hirb::Helpers::AutoTable.
  render(category_posts)

# 10.
puts "10. List the posts authored by a given user"

puts Hirb::Helpers::AutoTable.
  render(User.all.sample.posts)

# 11
puts "11. List the IDs of all posts authored by a given user (hint: there's an association method for this)"
f(User.all.sample.posts.pluck(:id))

puts "12. Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]"
puts "First user's posts before transfer:"
f(User.first.posts)
puts
f(User.first.posts = User.last.posts)
puts "Second user's posts after transfer:"
puts
f(User.first.posts)

# 12
puts "12. List the authors of a given post"
f(Post.all.sample.users)

# 13
puts "\n13. Set a collection of Users to replace a given Post's authors in a similar way"
puts "posts users before"
f(Post.first.users)
puts "switching..."
f(Post.first.users = Post.last.users)
puts "posts users after"
f(Post.first.users)

#14
puts "\n14. Accomplish the same thing by only using IDs (hint: there's an association method for this...)"
puts "Post users before"
f(Post.first.user_ids)
puts "switching..."
f(Post.first.user_ids = Post.all.sample.user_ids)
puts "Post user ids after"
f(Post.first.user_ids)

#15
puts "\n15. List the posts under a given tag"
f(Tag.all.sample.posts)


# 16
puts "\n16. Add a new post to a given tag by only using its ID"
f(Tag.all.sample.post_ids << Post.all.sample.id)

# 17
puts "\nAdd a new tag to a given post by only using its identifier"
f(Post.all.sample.tag_ids << Tag.all.sample.id)

# 18
puts "List the tags on a given post"
f(Post.all.sample.tags)