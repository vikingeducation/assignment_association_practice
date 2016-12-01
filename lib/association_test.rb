puts "List all Users, Comments, Posts, Categories or Tags"



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

def list_all
  puts "### USERS"
  puts User.all
  gets

  puts "### COMMENTS"
  puts Comment.all
  gets

  puts "### POSTS"
  puts Post.all
  gets

  puts "### CATEGORIES"
  puts Category.all
  gets

  puts "### TAGS"
  puts Tag.all
  gets
end