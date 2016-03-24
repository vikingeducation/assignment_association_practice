# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "destroying old data"

Category.delete_all
Comment.delete_all
Post.delete_all
PostTag.delete_all
PostUser.delete_all
Tag.delete_all
User.delete_all

puts "creating users"