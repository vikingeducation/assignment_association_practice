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
  p.save
end

def generate_comemnt
  body = Faker::Lorem.sentence(2)

  c  = Comment.new
  c[:body] = body
  c.save
end

def generate_user_posts(user)
  p = generate_post
  p.author_id = user.id
end

def generate_user_comments(user, post)
  c = generate_comment
  c.author_id = user.id
  c.post_id = post.id
end


(15).times { generate_user }

