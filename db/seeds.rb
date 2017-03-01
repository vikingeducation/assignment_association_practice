# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PostTagging.destroy_all
UserPosting.destroy_all
Comment.destroy_all
Post.destroy_all
User.destroy_all
Category.destroy_all
Tag.destroy_all


10.times do |i|
  Category.create!(name: "#{Faker::Book.genre}")
  Tag.create!(name: "#{Faker::Book.publisher}")
end

10.times do |i|
  i += 1
  2.times do
    j = rand(1..10)
    Post.create!(title: "#{Faker::Book.title}: Lorem ipsum dolor sit amet.", body: "#{j} Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia nisi nihil iste beatae esse dignissimos quam facere, consequuntur explicabo amet.", category_id: "#{Category.pluck(:id).sample}")
  end
  User.create!(name: "user#{i}")
  Comment.create!(body: "#{Faker::Book.title}", user_id: "#{i}", post_id: "#{i}")
  PostTagging.create!(post_id: "#{i}", tag_id: "#{Tag.pluck(:id).sample}")
  UserPosting.create!(user_id: User.pluck(:id).sample, post_id: Post.pluck(:id).sample)
end
