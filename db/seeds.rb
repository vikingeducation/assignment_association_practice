# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Config variables
# User names
USER_NAMES = [
  'george',
  'john',
  'henry',
  'tom',
  'billy'
]

# Post titles
POST_TITLES = [
  'Awesome',
  'Tubular',
  'Gnarly',
  'Super',
  'Fabulous',
  'Terrific',
  'Magnificent',
  'Totally',
  'Whoa',
  'Bodacious',
  'Boom'
]

# Category names
CATEGORY_NAMES = [
  'Fiddle',
  'Faddle',
  'Squabble',
  'Wabble',
  'Dabble'
]

# Tag names
TAG_NAMES = [
  'Abibliophobia',
  'Borborygm',
  'Codswallop',
  'Discombobulate',
  'Flummox'
]

# Text
TEXTS = [
  "Lorem ipsum.",
  "Lorem ipsum dolor sit amet.",
  "Lorem ipsum dolor sit amet, consectetur adipisicing elit.",
  "Harum fuga natus suscipit veniam!",
  "Harum fuga natus suscipit veniam, blanditiis doloribus!",
  "Harum fuga natus suscipit veniam, blanditiis doloribus, animi amet tenetur quam qui neque ea illum magni beatae!",
  "Harum fuga natus suscipit veniam, blanditiis doloribus, animi amet tenetur quam qui neque ea illum magni beatae, labore voluptatem maxime eum quidem!",
  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum fuga natus suscipit veniam, blanditiis doloribus, animi amet tenetur quam qui neque ea illum magni beatae, labore voluptatem maxime eum quidem!"
]

COUNT = USER_NAMES.length +
        POST_TITLES.length +
        CATEGORY_NAMES.length +
        TAG_NAMES.length +
        TEXTS.length

# Delete old data
puts 'Removing old data'
Rake::Task['db:migrate:reset'].invoke

# Create users
puts 'Creating users'
USER_NAMES.each_with_index do |first_name, i|
  USER_NAMES.each_with_index do |last_name, j|
    User.create(
      :name => "#{first_name}_#{last_name}#{i + 1}#{j + 1}"
    )
  end
end

# Create categories
puts 'Creating categories'
CATEGORY_NAMES.each do |category_name|
  Category.create(
    :name => category_name
  )
end

# Create tags
puts 'Creating tags'
TAG_NAMES.each do |tag_name|
  Tag.create(
    :name => tag_name
  )
end

# Create posts
puts 'Creating posts, user_postings and post_taggings'
COUNT.times do
  category = Category.all.sample

  post = Post.create(
    :title => "#{POST_TITLES.sample} #{POST_TITLES.sample}",
    :body => TEXTS.sample,
    :category_id => category.id
  )

  (rand(1..5)).times do
    # Create user_postings
    user = User.all.sample

    UserPosting.create(
      :post_id => post.id,
      :user_id => user.id
    )

    # Create post_taggings
    tag = Tag.all.sample

    PostTagging.create(
      :post_id => post.id,
      :tag_id => tag.id
    )
  end
end

# Create comments
puts 'Creating comments'
COUNT.times do
  user = User.all.sample
  
  (rand(1..5)).times do
    post = Post.all.sample

    Comment.create(
      :body => TEXTS.sample,
      :post_id => post.id,
      :user_id => user.id
    )
  end
end

puts 'Done!'













