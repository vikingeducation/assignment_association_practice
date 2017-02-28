# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  i += 1
  User.create!(name: "user#{i}")
  Post.create!(title: "#{i}: Lorem ipsum dolor sit amet.", body: "#{i} Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia nisi nihil iste beatae esse dignissimos quam facere, consequuntur explicabo amet.", category_id: "#{i}")
  Category.create!(name: "Category #{i}")
  Comment.create!(body: "#{i}: Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore, quos.", user_id: "#{i}", post_id: "#{i}")
  Tag.create!(name: "#{i} Lorem.")
  PostTagging.create!(post_id: "#{i}", tag_id: "#{i}")
  UserPosting.create!(user_id: User.pluck(:id).sample, post_id: Post.pluck(:id).sample)
end
