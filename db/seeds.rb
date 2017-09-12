# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def destroy_all_data
  puts "Destroying all data in the DB.."

  Category.destroy_all
  Comment.destroy_all
  PostTagging.destroy_all
  Post.destroy_all
  Tag.destroy_all
  UserPosting.destroy_all
  User.destroy_all

  puts "All DB data destroyed."
end

def create_users(num_users = 10)
  puts "Creating Users.."

  num_users.times do
    user = User.new(name: Faker::Name.unique.name)
    user.save!
  end

  puts "#{num_users} Users created."
end

def create_categories(num_categories = 10)
  puts "Creating Categories.."

  num_categories.times do
    category = Category.new(name: Faker::Hacker.unique.adjective.capitalize)
    category.save!
  end

  puts "#{num_categories} Categories created."
end

def create_posts(num_posts = 100)
  puts "Creating Posts.."

  category_ids = Category.pluck(:id)

  num_posts.times do
    post = Post.new(title: Faker::Hacker.noun.capitalize, body: Faker::Hacker.say_something_smart)
    post.category_id = category_ids.sample

    post.save!
  end

  puts "#{num_posts} Posts created."
end

def create_tags(num_tags = 10)
  puts "Creating Tags.."

  num_tags.times do
    tag = Tag.new(name: Faker::Hacker.unique.ingverb)
    tag.save!
  end

  puts "#{num_tags} Tags created."
end

def create_comments(comments_per_post = 3)
  puts "Creating Comments.."

  post_ids = Post.pluck(:id)
  user_ids = User.pluck(:id)

  post_ids.each do |post_id|
    comments_per_post.times do
      comment = Comment.new(body: Faker::Hacker.say_something_smart)
      comment.post_id = post_id
      comment.user_id = user_ids.sample

      comment.save!
    end
  end

  puts "#{comments_per_post} Comments per Post created."
end

def create_post_taggings(tags_per_post = 1)
  puts "Associating Tags with Posts.."

  post_ids = Post.pluck(:id)
  tag_ids = Tag.pluck(:id)

  post_ids.each do |post_id|
    tags_per_post.times do
      post_tagging = PostTagging.new(post_id: post_id, tag_id: tag_ids.sample)
      post_tagging.save!
    end
  end

  puts "Associated #{tags_per_post} #{"Tag".pluralize} with each Post."
end

def create_user_postings
  puts "Associating Posts with Users.."

  post_ids = Post.pluck(:id)
  user_ids = User.pluck(:id)

  post_ids.each do |post_id|
    user_posting = UserPosting.new(user_id: user_ids.sample, post_id: post_id)
    user_posting.save!
  end

  puts "Associated Posts with Users."
end

def seed_db
  destroy_all_data
  create_users
  create_categories
  create_posts
  create_tags
  create_comments
  create_post_taggings
  create_user_postings
end

seed_db
