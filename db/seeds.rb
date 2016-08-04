# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Destroying db crap"
Category.destroy_all
Comment.destroy_all
Post.destroy_all
User.destroy_all
Tag.destroy_all
UserPosting.destroy_all
PostTagging.destroy_all


puts "building categories"
3.times do |i|
  c = Category.create(name: "fake_category#{i}")
end

puts "building users"
3.times do |i|
  u = User.create(name: "Name#{i}")
end

puts "building posts"
20.times do |i|
  post = Post.create(title: "post#{i}", body: "body crap ##{i}", category_id: Category.all.sample.id)
end

puts "building comments"
50.times do |i|
  c = Comment.create(body: "body comment #{i}", user_id: User.all.sample.id, post_id: Post.all.sample.id)
end

puts "building tags"
3.times do |i|
  t = Tag.create(name: "tag name #{i}")
end

puts "connect posts and user"
User.all.each do |user|
  user.posts << Post.all.sample
  user.save
end

puts "connecting tags and posts"
Post.all.each do |post|
  post.tags << Tag.all.sample
  post.save
end
