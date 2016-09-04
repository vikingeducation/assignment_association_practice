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
10.times do |i|
  post = Post.create(title: "post#{i}", body: "body crap ##{i}", category_id: Category.all[i % 3].id)
end

puts "building comments"
10.times do |i|
  c = Comment.create(body: "body comment #{i}", user_id: User.all.sample.id, post_id: Post.all[i].id)
end

puts "building tags"
3.times do |i|
  t = Tag.create(name: "tag name #{i}")
end

i = 0
puts "connect posts and user"
User.all.each do |user|
  user.authored_posts << Post.all[(i)]
  i += 1
  user.save
end

puts "connecting tags and posts"
i = 0
Post.all.each do |post|
  post.tags << Tag.all[(i % Tag.all.length)]
  i += 1
  post.save
end
