# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cat_ids = Category.ids
tag_ids = Tag.ids
post_ids = Post.ids
user_ids = User.ids

50.times do |i|
  User.create(name: "user#{i}")
end

5.times do |i|
  Category.create(name: "category#{i}")
end

50.times do |i|

  Post.create(title: "title#{i}", body: "i am title#{i}'s body",
              category_id: cat_ids.sample)
end

10.times do |i|
  Tag.create(name: "tag#{i}")
end

50.times do |i|
  Comment.create(body: "i am comment#{i}'s body",
                 user_id: user_ids.sample, post_id: post_ids.sample)
end

30.times do |i|
  TagPost.create( tag_id:  tag_ids.sample,
                  post_id: post_ids.sample )
end

30.times do || 
end

