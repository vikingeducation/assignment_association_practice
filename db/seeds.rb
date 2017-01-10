puts "Creating users..."
10.times do 
  User.create(name: Faker::Name.first_name)
end

puts "Creating categories..."
5.times do
  Category.create(name: Faker::Pokemon.name)
end

puts "Creating posts..."
User.all.each do |user|
  5.times do
    user.posts.create(
      title: Faker::Music.instrument,
      body: Faker::Hipster.paragraph(2),
      category_id: Category.pluck(:id).sample
      )
  end
end

puts "Creating comments..."
Post.all.each do |post|
  2.times do
    post.comments.create(
      body: Faker::Hipster.sentence,
      post_id: post.id,
      user_id: post.users.first.id
      )
  end
end

puts "Creating tags..."
10.times do 
  Tag.create(name: Faker::App.name)
end

puts "Creating PostTags"
Tag.all.each do |tag|
  5.times do
    post = Post.all.sample
    PostTag.create(
      post_id: post.id,
      tag_id: tag.id
      )
  end
end