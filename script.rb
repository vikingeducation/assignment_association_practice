Hirb.enable

@new_comments = []
5.times { @new_comments << Comment.all.sample }
@array = [User.all, Category.all, Tag.all, Comment.all, Post.all]

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

def show_comments
  puts Hirb::Helpers::AutoTable.render(@new_comments)
end