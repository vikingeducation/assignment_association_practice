puts "Destroying everything..."
User.destroy_all
Category.destroy_all
Post.destroy_all
Tag.destroy_all
Comment.destroy_all
UserPost.destroy_all
PostTag.destroy_all
puts "DONE"

MULTIPLIER = 10

puts "Creating users..."
10.times do 
  User.create(name: Faker::Name.first_name)
end
puts "DONE"

puts "Creating categories..."
5.times do 
  Category.create(name: Faker::Pokemon.name)
end
puts "DONE"

puts "Creating posts..."
20.times do 
  Post.create(
    title: Faker::Music.instrument,
    body: Faker::Hipster.paragraph(2),
    category_id: Category.pluck(:id).sample
    )
end
puts "DONE"

puts "Creating tags..."
10.times do 
  Tag.create(name: Faker::App.name)
end
puts "DONE"

puts "Creating comments, user_posts, post_tags..."
Post.all.each do |post|
  Comment.create(
    body: Faker::Hipster.sentence,
    post_id: post.id,
    user_id: User.pluck(:id).sample
    )

  UserPost.create(
    user_id: User.pluck(:id).sample,
    post_id: post.id
    )

  PostTag.create(
    post_id: post.id,
    tag_id: Tag.pluck(:id).sample
    )
end
puts "DONE"