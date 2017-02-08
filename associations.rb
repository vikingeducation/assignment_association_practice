puts "\n\nList all users\n\n"
pp User.all
puts "\n\nList all posts\n\n"
pp Post.all
puts "\n\nList all categories\n\n"
pp Category.all
puts "\n\nList all tags\n\n"
pp Tag.all
puts "\n\nList all comments\n\n"
pp Comment.all
puts "\n\nList first user's comments\n\n"
pp User.first.comments
puts "\n\nSet a comment to belong to a different user\n\n"
pp User.last.comments.first.user
User.last.comments.first.user = User.all.sample
pp User.last.comments.first.user
puts "\n\nSet a post to a different Category\n\n"
pp Post.first.category
Post.first.category = Category.all.sample
pp Post.first.category
puts "\n\nSet a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])\n\n"
pp User.last.comments
User.last.comments = [Comment.all.sample, Comment.all.sample]
pp User.last.comments
puts "\n\nReturn a given comment's author\n\n"
pp Comment.all.sample.user
puts "\n\nList a given post's comments\n\n"
pp Post.all.sample.comments
puts "\n\nReturn a given comment's parent post\n\n"
pp Comment.all.sample.post
puts "\n\nRemove one post from a category's collection of posts\n\n"
pp Category.all.sample.posts.sample.delete
puts "\n\nList the posts authored by a given user\n\n"
pp User.first.posts
puts "\n\nList the IDs of all posts authored by a given user (hint: there's an association method for this)\n\n"
pp User.first.post_ids
puts "\n\nSet a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]\n\n"
pp User.first.posts = [Post.all.sample, Post.all.sample]
puts "\n\nList the authors of a given post\n\n"
pp Post.all.sample.users
puts "\n\nSet a collection of Users to replace a given Post's authors in a similar way\n\n"
pp Post.first.users = [User.all.sample, User.all.sample]
puts "\n\nAccomplish the same thing by only using IDs (hint: there's an association method for this...)\n\n"
pp Post.first.user_ids = [User.first.id, User.last.id]
puts "\n\nList the posts under a given tag\n\n"
pp Tag.first.posts
puts "\n\nAdd a new post to a given tag by only using its ID\n\n"
pp Tag.last.posts << Post.last
puts "\n\nAdd a new tag to a given post by only using its ID\n\n"
pp Post.last.tags << Tag.last
puts "\n\nList the tags on a given post\n\n"
pp Post.all.sample.tags


