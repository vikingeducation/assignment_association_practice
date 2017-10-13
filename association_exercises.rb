#!/usr/bin/ruby

def users_with_comments
  User
    .joins(:comments)
    .group('users.id')
    .having('count(comments.id) > 0')
end


def posts_with_comments
  Post
    .joins(:comments)
    .group('posts.id')
    .having('count(comments.id) > 0')
end

def all_the_things
  [User, Comment, Post, Category, Tag].each do |model|
    puts "\n###############{model}s BEGIN ##################"
    pp model.all
    puts "###############{model}s END ##################\n"
  end
end

def change_comment(original_user, new_user)
  new_user.comments << original_user.comments.first
  [original_user.reload, new_user.reload]
end

def change_all_comments(user)
  user.comments = [Comment.first, Comment.second, Comment.last]
  user.reload
end

def change_category(post)
  post.category = Category.all.sample
  post.save
  post.reload
end

def remove_post(category)
  target_post = category.posts.last
  category.posts.delete target_post
  category.reload
end

def replace_posts_for(user)
  user.posts = [Post.second, Post.last]
  user.reload
end

def replace_authors_for(post, opts = {})
  replacements = [User.last, User.third]
  if opts[:ids] == true
    post.user_ids = replacements.map &:id
  else
    post.users = replacements
  end
  post.reload
end

def add_post_by_id(tag, post_id)
  tag.posts << Post.find(post_id)
  tag.reload
end

def add_tag_by_id(post, tag_id)
  post.tags << Tag.find(tag_id)
  post.reload
end