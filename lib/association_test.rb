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

def list_all
  puts "################ USERS"
  p User.all.map { |u| u.name }
  gets

  puts "################ COMMENTS"
  p Comment.all.map { |c| c.body }
  gets

  puts "################ POSTS"
  p Post.all.map { |p| p.title }
  gets

  puts "################ CATEGORIES"
  p Category.all.map { |c| c.name }
  gets

  puts "################ TAGS"
  p Tag.all.map { |t| t.name }
  gets
end

def list_users_comments
  p User.first.comments.map { |c| c.body }
end

def set_comment_user
  comment = Comment.second
  puts "################ Initial User"
  p comment.user.name
  puts '################ Running comment.user = random'
  comment.user = User.all.sample
  comment.save
  comment.reload
  puts '################ New User'
  p comment.user.name
end

def set_post_category
  post = Post.first
  puts "################ Initial Category"
  p post.category.name
  puts '################ Running post.category = random'
  post.category = Category.all.sample
  post.save
  post.reload
  puts '################ New category'
  p post.category.name
end

def set_user_comments
  user = User.first
  puts '################ user\'s initial comments'
  p user.comments.map { |c| c.body }
  puts '################ Setting two comments for user'
  user.comments = [Comment.all.sample, Comment.all.sample]
  user.save
  user.reload
  puts '################ Displaying two comments'
  p user.comments.map { |c| c.body }
end

def show_comment_user
  p Comment.all.sample.user
end

def list_posts_comments
  begin
    post = Post.all.sample
  end while post.comments.empty?
  p post.comments.map { |c| c.body }

end

def show_comments_post
  p Comment.all.sample.post.title
end


def remove_post_category
  category = Category.all.sample
  post = category.posts.sample
  puts '################ Category\'s posts'
  p category.post_ids
  puts '################ Removing a post'
  category.posts.delete(post)
  category.save
  category.reload
  puts '################ Category\'s new posts'
  p category.post_ids
end

def list_users_posts
  begin
    user = User.all.sample
  end while user.posts.empty?
  p user.posts.map { |p| p.title }
end

def list_users_posts_ids
  p User.all.sample.post_ids
end

def set_users_posts
  user = User.all.sample
  puts '################Initial posts'
  p user.post_ids
  puts '################ Setting new posts'
  user.posts = [Post.second, Post.fourth]
  user.save
  user.reload
  puts '################ New posts!'
  p user.post_ids
end

def list_posts_users
  p Post.all.sample.users.map { |u| u.name }
end

def set_posts_users
  post = Post.first
  puts '################Initial users'
  p post.users.map { |u| u.name }
  puts '################ Setting new users'
  post.users = [User.second, User.fourth]
  post.save
  post.reload
  puts '################ New users!'
  p post.users.map { |u| u.name }
end

def set_posts_users_with_ids
  post = Post.all.sample
  puts '################ Post\'s initial user ids'
  p post.user_ids
  puts '################ Setting ids to 1, 2, and 3'
  post.user_ids << 1
  post.user_ids << 2
  post.user_ids << 3
  post.save
  post.reload
  puts '################ Post\'s new user ids'
  p post.user_ids
end

def list_tags_posts
  p Tag.all.sample.posts.map { |p| p.title }
end

def add_post_to_tag_via_post_id
  tag = Tag.all.sample
  post = Post.all.sample
  puts '################ Inital tag post ids'
  p tag.post_ids
  puts '################ Adding a new post id '
  tag.posts << Post.where(:id => post.id)
  tag.save
  tag.reload
  puts '################ New tag post ids'
  p tag.post_ids
end

def add_tag_to_post_via_tag_id
  post = Post.all.sample
  t1 = Tag.all.sample
  t2 = Tag.all.sample
  puts '################ Inital post tag ids'
  p post.tag_ids
  puts '################ Adding a new tag id 1, 2, 3'
  post.tag_ids << Tag.where(:id => t1.id)
  post.tag_ids << Tag.where(:id => t2.id)
  post.save
  post.reload
  puts '################ New post tag ids'
  p post.tag_ids
end

def list_posts_tags
  p Post.all.sample.tags.map { |t| t.id }
end

outputs = [:list_all,
           :list_users_comments,
           :set_comment_user,
           :set_post_category,
           :set_user_comments,
           :show_comment_user,
           :list_posts_comments,
           :show_comments_post,
           :remove_post_category,
           :list_users_posts,
           :list_users_posts_ids,
           :set_users_posts,
           :list_posts_users,
           :set_posts_users,
           :set_posts_users_with_ids,
           :list_tags_posts,
           :add_post_to_tag_via_post_id,
           :add_tag_to_post_via_tag_id,
           :list_posts_tags]

prompts.each_with_index do |prompt, index|
  puts prompt
  send(outputs[index])
  gets
end
