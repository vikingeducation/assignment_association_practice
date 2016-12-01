puts "Resetting the database"
Rake::Task["db:reset"]

puts "Creating Users"

10.times do
  User.create!(name: Faker::GameOfThrones.character)
end

puts "Creating categories"
5.times do
  Category.create!(name: Faker::Company.buzzword)
end

puts "Creating tags"
15.times do
  Tag.create!(name: Faker::Hacker.adjective)
end

puts "Creating posts"
50.times do
  Post.create!(title: Faker::Lorem.sentence, 
               body: Faker::Lorem.paragraph,
               category_id: Faker::Number.between(Category.first.id, Category.last.id))
end

puts "Creating comments"
50.times do
  Comment.create!(user_id: Faker::Number.between(User.first.id, User.last.id), 
                  post_id: Faker::Number.between(Post.first.id, Post.last.id), 
                  body: Faker::Lorem.paragraph)
end

puts "Creating join table posttag"
100.times do 
  Posttag.create!(
                tag_id: Faker::Number.between(Tag.first.id, Tag.last.id),
                post_id: Faker::Number.between(Post.first.id, Post.last.id)
   )

end

puts "Creating join table userposts"
100.times do 
    Userpost.create!(
                  user_id: Faker::Number.between(User.first.id, User.last.id),
                  post_id: Faker::Number.between(Post.first.id, Post.last.id)
                  )
end