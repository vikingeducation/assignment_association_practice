# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

multiplier = 1

(5*multiplier).times do 
  User.create({name: Faker::Name.name})
  Category.create({name: Faker::Hipster.word})
end

#Posts
(10*multiplier).times do
  post = Post.create({title:Faker::Hipster.sentence(rand(1..4)), body: Faker::Hipster.paragraph, category_id: rand(1..Category.all.length)})

  Comment.create({body: Faker::Hipster.paragraph, post_id: post.id, user_id: rand(1..User.all.length)})

  Tag.create({name: Faker::Hipster.word})

end
