puts "Resetting the database"
Rake::Task["db:reset"]

puts "Creating Users"
10.times do
  User.create!(name: Faker::GameOfThrones.character)
end
5.times do
  Category.create!(title: Faker::Company.buzzword)
end
15.times do
  Tag.create!(title: Faker::Hacker.adjective)
end
50.times do
  Post.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, category_id: Faker::Number.between(Category.first.id, Category.last.id))
end
50.times do
  Comment.create!(user_id: Faker::Number.between(User.first.id, User.last.id), post_id: Faker::Number.between(Post.first.id, Post.last.id), body: Faker::Lorem.paragraph)
end
