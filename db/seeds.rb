# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroy all"
User.destroy_all
Post.destroy_all
Category.destroy_all
Comment.destroy_all
Tag.destroy_all

puts "create userrs \n"

5.times do
  User.create(name: Faker::Internet.user_name)
end

puts "create categories \n"

5.times do
  Category.create(name: Faker::Commerce.department)
end

puts "create posts\n"

20.times do
  Post.create(title: Faker::StarWars.character,
              body: Faker::StarWars.quote,
              category_id: Category.all.sample.id)
  Post.last.authors << User.all.sample
end

puts "assign users to more posts\n"
User.all.each do |user|
  2.times do
    user.authored_posts << Post.all.sample
  end
end

puts "creates comments\n"
20.times do
  Comment.create(body: Faker::ChuckNorris.fact,
                  user_id: User.all.sample.id,
                  post_id: Post.all.sample.id)
end

puts "creat tags\n"

5.times do
  Tag.create(name: Faker::Space.planet)
  Tag.last.posts << Post.all.sample
end

puts "assign more posts to tags\n"

Post.all.each do |post|
  post.tags << Tag.all.sample
end

puts "and teh deed is done\n"
