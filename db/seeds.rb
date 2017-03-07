# destroy all
User.destroy_all
Post.destroy_all
Category.destroy_all
Tag.destroy_all
Tagging.destroy_all
Comment.destroy_all

# create users
10.times do 
  User.create(name: Faker::Superhero.name)
end

# all user id's
users = User.pluck(:id)

# create categories
5.times do 
  Category.create(name: Faker::Superhero.power)
end

# create posts
categories = Category.pluck(:id)
30.times do 
  Post.create(title: Faker::HarryPotter.location, body: Faker::HarryPotter.quote, 
    category_id: categories.sample
  )
end

# create tags
15.times do
  Tag.create(name: Faker::Lorem.word)
end

# all tag id's 
tags = Tag.pluck(:id)

# create comments 
posts = Post.pluck(:id)
50.times do 
  Comment.create(body: Faker::Lorem.sentence,
      user_id: users.sample, post_id: posts.sample
    )
end

# create postings
Post.all.each do |post|
  rand(1..5).times do 
    Posting.create(post_id: post.id, user_id: users.sample)
    Tagging.create(post_id: post.id, tag_id: tags.sample)
  end
end