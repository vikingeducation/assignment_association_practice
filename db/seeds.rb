# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
include Faker

puts "destroying old data"

Category.delete_all
Comment.delete_all
Post.delete_all
PostTag.delete_all
PostUser.delete_all
Tag.delete_all
User.delete_all

puts "creating categories"
10.times do
  Category.create( :name => Color.color_name
                  )
end

puts "creating users"
10.times do
  User.create( :name => Name.name
              )
end

# Gotta build categories first, otherwise sample won't work.
puts "creating posts"
10.times do
  Post.create( :title => Name.name,
               :body => Lorem.paragraph,
               :category_id => Category.ids.sample
              )
end

# Gotta build users and posts before I build this otherwise the samples won't work. 
puts "creating comments"
10.times do
  Comment.create( :body => Lorem.paragraph,
                  :user_id => User.ids.sample,
                  :post_id => Post.ids.sample
                  )
end

puts "creating tags"
10.times do
  Tag.create( :name => Company.buzzword
              )
end

puts "creating post tag joins"
10.times do
  PostTag.create( :post_id => Post.ids.sample,
                  :tag_id => Tag.ids.sample)
end

puts "creating post user joins"
10.times do
  PostUser.create( :post_id => Post.ids.sample,
                  :user_id => User.ids.sample)
end

