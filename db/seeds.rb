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
UserPost.destroy_all
Comment.destroy_all
Tag.destroy_all
Tagging.destroy_all

10.times do 
  User.create(name: Faker::Name.name)
end

10.times do 
  Category.create(name: Faker::Commerce.department)
end

10.times do 
  Post.create(title: Faker::Commerce.product_name, body: Faker::Lorem.paragraph, category_id: Category.all.sample.id)
end

50.times do 
  UserPost.create(post_id: Post.all.sample.id, user_id: Post.all.sample.id)
end

50.times do 
  Comment.create(body: Faker::Lorem.paragraph, user_id: User.all.sample.id, post_id: Post.all.sample.id)
end

40.times do 
  Tag.create(name: Faker::Company.name)
end

50.times do 
  Tagging.create(post_id: Post.all.sample.id, tag_id: Tag.all.sample.id)
end