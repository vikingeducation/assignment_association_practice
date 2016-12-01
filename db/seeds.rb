# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def create_users(num)
end

def create_posts
end

def create_comments
end

def create_categories
end

def create_tags
end

puts "Erasing prior databas"

User.destroy_all
Post.destroy_all
Comment.destroy_all
Tag.destroy_all

puts "All Destroyed"

puts "Creating Users"

create_users 5
