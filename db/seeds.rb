# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MULTIPLIER = 5

MULTIPLIER.times do |idx|
  User.create(name: "User #{idx}")
end

User.all.each do |user|
  MULTIPLIER.times do |index|
    user.authored_posts.create(title: "#{user.name}'s post #)#{index}",
                     body: "This is a test post number #{index * user.id}")
  end
end

Post.all.each do |post|
  MULTIPLIER.times do |index|
    user_id = rand(1..MULTIPLIER)
    post.comments.create(body: "Test comment #{index}", user_id: user_id)
  end
end

MULTIPLIER.times do |idx|
  Tag.create(name: "Test Tag #{idx}")
end

Post.all.each do |post|
  new_tag = Tag.all.sample
  post.tags << new_tag
end
