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
  puts Hirb::Helpers::AutoTable.render(comment)
end

def set_post_to_category(post, category)
  post[:category_id] = category.id
  puts Hirb::Helpers::AutoTable.render(post)
end

def replace_user_comments(user, new_comments)
  user.comments = new_comments
  puts Hirb::Helpers::AutoTable.render(user.comments)
end

def show_comments
  puts Hirb::Helpers::AutoTable.render(@new_comments)
end