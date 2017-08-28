MODELS = [User, Comment, Post, Category, Tag]

# List all Users, Comments, Posts, Categories or Tags
def list_all(model)
  puts "Listing all #{model.to_s.pluralize}.."
  p model.all
  puts
end

# List a given user's comments
def list_comments(user)
  puts "Listing Comments for User.."
  p user.comments
  puts
end

# Set a comment to belong to a different user
def set_comment_to_different_user
  comment = Comment.all.sample

  puts "Comment #{comment.id} currently belongs to User #{comment.user.id}."

  user = comment.user
  user = User.all.sample until user != comment.user

  comment.user = user
  comment.save!

  puts "Comment #{comment.id} now belongs to User #{comment.user.id}."
end

# Set a post to be in a different category
def set_post_to_different_category
  post = Post.all.sample

  puts "Post #{post.id} currently belongs to Category #{post.category.id}."

  category = post.category
  category = Category.all.sample while category == post.category

  post.category = category
  post.save!

  puts "Post #{post.id} now belongs to Category #{post.category.id}."
end

# Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])
def replace_user_comments(num_comments = 5)
  random_comments = Comment.all.sample(num_comments)

  user = User.all.sample
  puts "User #{user.id} currently has the Comments: #{user.comments.pluck(:id)}"

  user.comments = random_comments
  puts "User #{user.id} now has the Comments: #{user.comments.pluck(:id)}"
end

# Return a given comment's author
def get_comment_author(comment)
  if comment.user
    puts "Comment #{comment.id} has author #{comment.user.id}."
    return comment.user
  else
    puts "Comment #{comment.id} has no author (you may want to check why!)"
  end
end

# List a given post's comments
def list_post_comments(post)
  if post.comments
    puts "Post #{post.id} has the following Comments: "
    post.comments.each { |comment| puts "#{comment.id}: #{comment.body}" }
  else
    puts "Post #{post.id} has no Comments."
  end
end

# Return a given comment's parent post
def get_comment_parent(comment)
  if comment.post
    puts "Comment #{comment.id}'s parent Post is #{comment.post.id}."
    comment.post
  else
    puts "Comment #{comment.id} has no parent Post (you may want to check why!)"
  end
end

# Remove one post from a category's collection of posts
def remove_post_from_category
  category = Category.all.sample
  puts "Category #{category.id} has the following Posts: #{category.posts.pluck(:id)}"

  category.posts.first.destroy

  puts "Category #{category.id} now has the following Posts: #{category.posts.pluck(:id)}"
end

# List the posts authored by a given user
def list_posts_authored_by(user)
  puts "User #{user.id} has the following posts: "

  user.posts.each do |post|
    puts "ID: #{post.id}"
    puts "Title: #{post.title}"
    puts "Body: #{post.body}"
  end
end

# List the IDs of all posts authored by a given user (hint: there's an association method for this)
def list_posts_id_authored_by(user)
  puts "User #{user.id} authored the following Post IDs:"
  p user.posts.pluck(:id)
end

# Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]
def replace_user_posts(num_posts = 5)
  random_posts = Post.all.sample(num_posts)

  user = User.all.sample
  puts "User #{user.id} currently has the Posts: #{user.posts.pluck(:id)}"

  user.posts = random_posts
  puts "User #{user.id} now has the Posts: #{user.posts.pluck(:id)}"
end

# List the authors of a given post
def list_post_authors(post)
  puts "Post #{post.id} has these authors:"
  post.users.each do |author|
    puts "Name: #{author.name}"
  end
end

# Set a collection of Users to replace a given Post's authors in a similar way
def replace_post_authors(num_authors = 3)
  post = Post.all.sample
  list_post_authors(post)

  random_authors = User.all.sample(num_authors)
  post.users = random_authors
  list_post_authors(post)
end

# Accomplish the same thing by only using IDs (hint: there's an association method for this...)
def replace_post_authors_by_id(num_authors = 3)
  post = Post.all.sample
  list_post_authors(post)

  random_author_ids = User.all.pluck(:id).sample(num_authors)
  post.user_ids = random_author_ids
  list_post_authors(post)
end

# List the posts under a given tag
def list_posts_under_tag(tag)
  if tag.posts
    puts "Tag #{tag.id} has these Posts:"
    tag.posts.each do |post|
      puts "ID: #{post.id}"
      puts "Title: #{post.title}"
      puts "Body: #{post.body}"
    end
  else
    puts "Tag #{tag.id} has no Posts."
  end
end

# List the tags on a given post
def list_tags_on_post(post)
  if post.tags
    puts "Post #{post.id} has these Tags:"
    post.tags.each { |tag| puts "#{tag.name}" }
  else
    puts "Post #{post.id} has no Tags."
  end
end

# Add a new post to a given tag by only using its ID
# (it looks like I have to do this by adding a new PostTagging)
def add_post_to_tag_by_id(post_title, post_body, tag)
  puts "Tag #{tag.id} has these Posts: "
  p tag.posts.pluck(:title)

  post = Post.new(title: post_title, body: post_body)
  post.category_id = Category.pluck(:id).sample
  post.save!
  puts "Post #{post.id} created."

  unless PostTagging.exists?(tag_id: tag.id, post_id: post.id)
    PostTagging.create!(tag_id: tag.id, post_id: post.id)
  end

  puts "Tag #{tag.id} now has these Posts: "
  p tag.posts.pluck(:title)
end

# Add a new tag to a given post by only using its ID
# (it looks like I have to do this by adding a new PostTagging)
def add_tag_to_post_by_id(post, tag_name)
  puts "Post #{post.id} has these Tags: "
  p post.tags.pluck(:name)

  tag = Tag.create!(name: tag_name)
  puts "Tag #{tag.id} created."

  unless PostTagging.exists?(tag_id: tag.id, post_id: post.id)
    PostTagging.create!(tag_id: tag.id, post_id: post.id)
  end

  puts "Post #{post.id} now has these Tags: "
  p post.tags.pluck(:name)
end

def run_tests
  # list_all(MODELS.sample)
  # list_comments(User.all.sample)
  # set_comment_to_different_user
  # set_post_to_different_category
  # replace_user_comments
  # get_comment_author(Comment.all.sample)
  # list_post_comments(Post.all.sample)
  # get_comment_parent(Comment.all.sample)
  # remove_post_from_category
  # list_posts_authored_by(User.all.sample)
  # list_posts_id_authored_by(User.all.sample)
  # replace_user_posts
  # list_post_authors(Post.all.sample)
  # replace_post_authors
  # replace_post_authors_by_id
  # list_posts_under_tag(Tag.all.sample)
  # list_tags_on_post(Post.all.sample)
  # add_post_to_tag_by_id("Post Title", "Post Body", Tag.all.sample)
  # add_tag_to_post_by_id(Post.all.sample, "Hawt Tag")
end

run_tests
