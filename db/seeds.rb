# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Tag.destroy_all
Post.destroy_all
User.destroy_all
TagPost.destroy_all
UserPost.destroy_all


50.times do |i|
  User.create(name: "user#{i}")
end
user_ids = User.ids

5.times do |i|
  Category.create(name: "category#{i}")
end

cat_ids = Category.ids

50.times do |i|

  post = Post.create(title: "title#{i}", body: "i am title#{i}'s body",
              category_id: cat_ids.sample)
  UserPost.create(user_id: user_ids.sample,
                  post_id: post.id)
end

post_ids = Post.ids

10.times do |i|
  Tag.create(name: "tag#{i}")
end

tag_ids = Tag.ids

50.times do |i|
  Comment.create(body: "i am comment#{i}'s body",
                 user_id: user_ids.sample, post_id: post_ids.sample)
end

30.times do |i|
  TagPost.create( tag_id:  tag_ids.sample,
                  post_id: post_ids.sample )
end

