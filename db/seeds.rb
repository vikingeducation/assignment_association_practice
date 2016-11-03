# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Destroying all data"
Category.destroy_all
Comment.destroy_all
User.destroy_all
Tag.destroy_all
Post.destroy_all
PostTag.destroy_all
UserPost.destroy_all
puts "All data gone..."
puts "Creating new data...."


15.times do
  u = User.new
  u.name = Faker::Name.name
  u.save!


  t = Tag.new
  t.name = Faker::Lorem.word
  t.save!


  c = Category.new
  c.name = Faker::Commerce.department(2, true)
  c.save!

  p = Post.new
  p.title = Faker::Lorem.word
  p.body = Faker::Lorem.sentence
  p.category_id = Category.all.sample.id
  p.save!
end


30.times do
  pt = PostTag.new
  pt.post_id = Post.all.sample.id
  pt.tag_id = Tag.all.sample.id
  pt.save!

  co = Comment.new
  co.body = Faker::Lorem.sentence
  co.user_id = User.all.sample.id
  co.post_id = Post.all.sample.id
  co.save!


  up = UserPost.new
  up.user_id = User.all.sample.id
  up.post_id = Post.all.sample.id
  up.save!
end
puts "Done!"
