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

# create categories
5.times do 
  Category.create(name: Faker::Superhero.power)
end

# 
users = User.pluck(:id)
categories = Category.pluck(:id)

# create posts
30.times do 
  Post.create(title: Faker::HarryPotter.location, body: Faker::HarryPotter.quote, 
    category_id: categories.sample
  )
end

#
posts = Post.pluck(:id)

# create tags
15.times do
  Tag.create(name: Faker::Lorem.word)
end

# 
tags = Tag.pluck(:id)

# create comments 
50.times do 
  Comment.create(body: Faker::Lorem.sentence,
      user_id: users.sample, post_id: posts.sample
    )
end

# create postings
20.times do
  Posting.create(post_id: posts.sample, user_id: users.sample) 
end 

# creating taggings
40.times do
  Tagging.create(post_id: posts.sample, tag_id: tags.sample) 
end