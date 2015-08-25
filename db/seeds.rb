# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Comment.destroy_all
Post.destroy_all
User.destroy_all
Tag.destroy_all
Authorship.destroy_all
Tagging.destroy_all
5.times do
  User.create({name: Faker::Name.name })
end

User.all.each do |user|
 user.authored_posts.create( {title: Faker::Name.title, body: Faker::Lorem.sentence})
end


Post.all.each do |post|
  rand(1..3).times do
    post.comments.create( {body:  Faker::Lorem.sentence, user_id: User.all.sample.id})

    post.tags.create( {name: Faker::Lorem.word})
  end

end


