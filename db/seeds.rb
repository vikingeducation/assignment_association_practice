# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do | i |
  User.create!(:name => "user_#{i}")
end

5.times do | i |
  Category.create!(:name => "category_#{i}")
end

5.times do | i |
  Category.posts.build(:name => "post_#{i}").save
end

5.times do | i |
  User.comments.build(:body => "body_#{i}").save
end

