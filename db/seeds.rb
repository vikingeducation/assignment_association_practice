# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Post.destroy_all
Category.destroy_all
Comment.destroy_all
Tag.destroy_all

puts "Old records destroyed"

def generate_user
  name = Faker::Book.author
  u = User.new
  u[:name] = name
  u.save
end


def generate_category
  name = Faker::Commerce.department(1)
  c = Category.new
  c[:name] = name
  c.save
end

def generate_tag
  name = Faker::Hipster.word
  t = Tag.new
  t[:name] = name
  t.save
end

def generate_post
  title = Faker::Book.title
  body = Faker::Lorem.paragraph

  p = Post.new
  p[:title] = title
  p[:body] = body
  p[:category_id] = Category.all.sample.id
  p.save
  p
end

def generate_comment
  body = Faker::Lorem.sentence(2)

  c  = Comment.new
  c[:body] = body
  c.save
  c
end

def generate_user_posts(user)
  post = generate_post
  generate_post_tags(post)
  UserPost.create(author_id: user.id, post_id: post.id)
end

def generate_user_comments(user)
  5.times do
    post = Post.all.sample
    c = generate_comment
    c.update(author_id: user.id, post_id: post.id)
  end
end

def generate_post_tags(post)
  3.times do
    tag = Tag.all.sample
    PostTag.create(post_id: post.id, tag_id: tag.id)
  end
end

puts "Generating users"
(15).times { generate_user }

puts "Generating categories"
(10).times { generate_category }

puts "Generating tags"
(10).times { generate_tag }

puts "Assigning posts to users"
User.all.each do |user|
  5.times do
    generate_user_posts(user)
  end
end

puts "Assigning comments to posts and users"

User.all.each do |user|
  generate_user_comments(user)
end