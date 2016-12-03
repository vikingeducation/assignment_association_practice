# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# TODO: Refactor to use .all instead of arrays



# Clean the database

PostTag.destroy_all
PostUser.destroy_all
Comment.destroy_all
Tag.destroy_all
Post.destroy_all
Category.destroy_all
User.destroy_all


NUM_USERS = 20
NUM_POSTS = 100
NUM_CATEGORIES = 5
NUM_TAGS = 3
NUM_COMMENTS = 200
NUM_POST_TAGS = 100
NUM_POST_USERS = 140


## Create Users
users = []
NUM_USERS.times do |i|
  users << User.create(name: Faker::Name.name)
end

## Create Categories
categories = []
NUM_CATEGORIES.times do |i|
  categories << Category.create(name: Faker::Pokemon.name)
end

## Create Posts
posts = []
NUM_POSTS.times do |i|
  posts << Post.create({title: Faker::ChuckNorris.fact,
                        body: Faker::Lorem.paragraph,
                        category_id: categories.sample.id})
end

## Create Comments
NUM_COMMENTS.times do |i|
  Comment.create({ body: Faker::Lorem.paragraph,
                   user_id: users.sample.id,
                   post_id: posts.sample.id })
end

## Create Tags
tags = []
NUM_TAGS.times do |i|
  tags << Tag.create(name: Faker::Music.instrument)
end


####### Many-to-Many

NUM_POST_TAGS.times do |i|
  PostTag.create({ post_id: posts.sample.id,
                    tag_id: tags.sample.id })
end


NUM_POST_USERS.times do |i|
  if i.even?
    2.times do |j|
      PostUser.create({ user_id: users.sample.id,
                        post_id: posts[i/2].id })
    end
  elsif i % 5 == 0
    2.times do |k|
      PostUser.create({ user_id: users[i/7].id,
                        post_id: posts.sample.id })    
    end  
  else
      PostUser.create({ user_id: users.sample.id,
                        post_id: posts[i/2].id })    
  end
end





