puts "Cleaning Database"
DatabaseCleaner.clean_with :truncation

# users
puts "Creating Users"

7.times do
  User.create!(name: Faker::Name.name )
end
# categories

puts "Creating Catogories"

10.times do
  Category.create!(name: Faker::Lorem.word)
end

# tags

puts "Creating Tags"
6.times do
  Tag.create!(name: Faker::Lorem.word)
end

# association

# User X:X Posts, Category 1:X Post

puts "Creating Posts"
User.all.each do |user|
  (rand(1..5)).times do
    user.posts.create! do |p|
      p.title = Faker::Lorem.sentence
      p.body = Faker::Lorem.paragraph
      p.category = Category.find(Category.pluck(:id).sample)
    end
  end
end
# User 1:X Comments, Post 1:X Comments

puts "Adding Comments to Some Posts"
7.times do
  post = Post.find(Post.pluck(:id).sample)

  post.comments.create!(body: Faker::Lorem.paragraph, user_id: rand(1..7))
end
# Post X:X Tags

puts "Adding Tags to Some Posts"
6.times do |n|
  PostTagging.create!(post_id: n + 1, tag_id: rand(1..6))
end
