# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# destroy all existing records every time

puts "Destroying All Data"

Category.destroy_all
Comment.destroy_all
Post.destroy_all
Tag.destroy_all
User.destroy_all
PostTag.destroy_all
UserPost.destroy_all

puts "All Existing Data Destroyed - Database Clean and Ready to Populate"


# Multiplier
MULTIPLIER = 10

# Helper methods to generate data

# Generate Categories
def generate_categories
  c = Category.new
  c[:name] = Faker::Space.galaxy
  c.save
end

# Generate Users
def generate_users
  users = (1..10).to_a.map do |n|
    name = Faker::Internet.user_name

    User.create!(
      name: name
    )
  end
  users
end

# Generate Posts
def generate_posts(users)
  30.times do |n|
    title = Faker::Lorem.sentence(5)
    body = Faker::Lorem.paragraph
    category_id = Category.pluck(:id).sample

    post = Post.create!(
      title:  title,
      body:   body,
    )

    post.user_posts.create(
      user: users[0]
    )

    post.user_posts.create(
      user: users[rand(users.size)]
    )

  end
end

# Generate Comments
 def generate_comments
   c = Comment.new
   c[:body] = Faker::Lorem.sentence(12)
   c[:user_id] = User.pluck(:id).sample
   c[:post_id] = Post.pluck(:id).sample
   c.save
 end

# Generate Tags
def generate_tags
  posts = Post.all
  10.times do |n|
    name = Faker::Space.moon
    tag = Tag.create!(
          name: name
    )

    tag.post_tags.create(
      post: posts[0]
    )

    tag.post_tags.create(
      post: posts[rand(posts.size)]
    )
  end
end


# Populate PostTag table with posts and tags
def associate_posts_and_tags
  posts = Post.all
  posts.each do |post|
    pt = PostTag.new
    pt[:post_id] = post.id
    pt[:tag_id] = Tag.pluck(:id).sample
    pt.save
  end
end

# Seed DataBase

# Create Categories
MULTIPLIER.times { generate_categories }
puts "Created Categories"

# Create users
# Create posts
generate_posts(generate_users)
puts "Created Posts and Users"

# Create Comments
MULTIPLIER.times { generate_comments }
puts "Created Comments"

# Create tags
generate_tags 
puts "Create Tags"
