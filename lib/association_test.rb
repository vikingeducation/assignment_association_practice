puts "Running association tests"



prompts = ['List all Users, Comments, Posts, Categories or Tags.',
'List a given user\'s comments',
'Set a comment to belong to a different user',
'Set a post to be in a different category',
'Set a collection of comments to replace a user\'s current comments (e.g. User.first.comments = [Comment.first, Comment.second])',
'Return a given comment\'s author',
'List a given post\'s comments',
'Return a given comment\'s parent post',
'Remove one post from a category\'s collection of posts',
'List the posts authored by a given user',
'List the IDs of all posts authored by a given user (hint: there\'s an association method for this)',
'Set a collection of Posts to replace that user\'s currently authored posts, e.g. User.first.posts = [Post.first, Post.second]',
'List the authors of a given post',
'Set a collection of Users to replace a given Post\'s authors in a similar way',
'Accomplish the same thing by only using IDs (hint: there\'s an association method for this...)',
'List the posts under a given tag',
'Add a new post to a given tag by only using post\'s ID',
'Add a new tag to a given post by only using tag\'s ID',
'List the tags on a given post']

outputs = [list_all,
           list_users_comments,
           set_comment_user,
           set_post_category,
           set_user_comments,
           show_comment_user,
           list_posts_comments,
           show_comments_post,
           remove_post_category,
           list_users_posts,
           list_users_posts_ids,
           set_users_posts,
           list_posts_users,
           set_posts_users,
           set_posts_users_with_ids,
           list_tags_posts,
           add_post_to_tag_via_post_id,
           add_tag_to_post_via_tag_id,
           list_posts_tags]

prompts.each_with_index do |prompt, index|
  puts prompt
  output[index]
  gets
end


def list_all
  puts "### USERS"
  User.all
  gets

  puts "### COMMENTS"
  Comment.all
  gets

  puts "### POSTS"
  Post.all
  gets

  puts "### CATEGORIES"
  Category.all
  gets

  puts "### TAGS"
  Tag.all
  gets
end

def list_users_comments
  User.first.comments
end

def set_comment_user
  comment = Comment.first
  puts "### Initial User"
  comment.user
  puts '### Running comment.user = User.first'
  comment.user = User.first
  puts '### New User'
  comment.user
end

def set_post_category
  post = Post.first
  puts "### Initial Category"
  post.category
  puts '### Running post.category = Category.first'
  post.category = Category.first
  puts '### New category'
  post.category
end

def set_user_comments
  user = User.first
  puts '### user\'s initial comments'
  user.comments
  puts '### Setting two comments for user'
  user.comments = [Comment.first, Comment.second]
  puts '### Displaying two comments'
  user.comments
end

def show_comment_user
  Comment.all.sample.user
end

def list_posts_comments
  begin
    post = Post.all.sample
  end while post.comments.empty?
  post.comments
end

def show_comments_post

end





