# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

QUANTITY = 10

QUANTITY.times do |it|
  User.create(name: Faker::Name.name )
  Category.create(name: Faker::Book.genre )
end

QUANTITY.times do |it|
  Post.create(
    title: Faker::Hipster.sentence(3),
    body: Faker::Hipster.paragraphs(1),
    category_id: Category.all.sample )
  Tag.create(name: Faker::SlackEmoji.activity)

  UserPost.create(user_id: User.all.sample, post_id: Post.last)
  PostTag.create(post_id: Post.last , tag_id: Tag.last)
end
