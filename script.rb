Hirb.enable

def populate_sample
  @new_comments = []
  @new_posts = []
  @new_authors = []
  5.times { @new_comments << Comment.all.sample }
  5.times { @new_posts << Post.all.sample }
  3.times { @new_authors << User.all.sample }
  @array = [User.all, Category.all, Tag.all, Comment.all, Post.all]
end

def table_render(table)
  puts Hirb::Helpers::AutoTable.render(table)
end

def render_all(array)
  array.each do |table|
    table_render(table)
  end
end

def user_comments(user)
  table_render(user.comments)
end

def set_comment_to_user(comment, user)
  comment[:author_id] = user.id
  table_render(comment)
end

def set_post_to_category(post, category)
  post[:category_id] = category.id
  table_render(post)
end

def replace_user_comments(user, new_comments)
  user.comments = new_comments
  table_render(user.comments)
end

def return_comment_author(comment)
  table_render(comment.author) 
end

def list_post_comments(post)
  table_render(post.comments)
end

def list_comment_post(comment)
  table_render(comment.post)
end

def remove_category_post(category)
  random_post = category.posts.sample
  category.posts.delete(random_post)
  table_render(category.posts)
end

def list_author_post(user)
  table_render(user.posts)
end

def list_all_ids(user)
  table_render(user.post_ids)
end

def replace_user_posts(user, new_posts)
  user.posts = new_posts
  table_render(user.posts)
end

def list_post_authors(post)
  table_render(post.authors)
end

def replace_post_authors(post, new_authors)
  post.authors = new_authors
  table_render(post.authors)
end

def replace_post_authors_by_id(post, new_author_ids)
  post.author_ids = new_author_ids
  table_render(post.authors)
end

def list_tag_posts(tag)
  table_render(tag.posts)
end

def add_post_to_tag_by_id(tag, new_post_id)
  tag.post_ids = tag.post_ids << new_post_id
  table_render(tag.posts)
end

def add_tag_to_post_by_id(post, new_tag_id)
  post.tag_ids = post.tag_ids << new_tag_id
  table_render(post.tags)
end

def list_post_tags(post)
  table_render(post.tags)
end