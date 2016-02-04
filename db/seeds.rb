# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'
seed_multiplier = 1

users = []
(10 * seed_multiplier).times do |i|
  u = User.create( name: Faker::Name.last_name )
  users << u
end

posts = []
(10 * seed_multiplier).times do |i|
  p = Post.create( title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph )
  posts << p
end

comments = []
(40 * seed_multiplier).times do |i|
  c = Comment.create( body: Faker::Lorem.paragraph )
  comments << c
end

categories = []
(10 * seed_multiplier).times do |i|
  c = Category.create( name: Faker::Lorem.word )
  categories << c
end

tags = []
( 50 * seed_multiplier).times do |i|
  t = Tag.create( name: Faker::Lorem.word )
  tags << t
end

# comments.each_with_index do | comment, i |
#   puts comment.body
# end

comments.each_with_index do | comment, i |
  comment.user = users[i % users.length]
  comment.post = posts[i % users.length]
  users[i % users.length].comments << comment
  posts[i % users.length].comments << comment
end

posts.each_with_index do | post, i |
  post.category = categories[i % categories.length]
  categories[i % categories.length].posts << post
end

user_posts = []
( 50 * seed_multiplier).times do |i|
  up = UserPost.create
  users[i % users.length].user_posts << up
  up.user = users[i % users.length]
  posts[i % posts.length].user_posts << up
  up.post = posts[i % posts.length]
end

post_tags = []
( 50 * seed_multiplier).times do |i|
  pt = PostTag.create
  posts[i % posts.length].post_tags << pt
  pt.post = posts[i % posts.length]
  tags[i % tags.length].post_tags << pt
  pt.tag = tags[i % tags.length]
end

users.each { |user| user.save }
comments.each { |comment| comment.save }
posts.each { |post| post.save }
user_posts.each { |user_post| user_post.save }
post_tags.each { |post_tag| post_tag.save }


