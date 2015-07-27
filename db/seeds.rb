# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = []
5.times do |i|
  users << User.create(name: "foo#{i}")
end

users.each do |user|
  5.times do |i|
    user.posts << Post.create(title: "Post#{i} of #{user.name}", body: "post body #{i} of #{user.name}")
  end
end

users.each do |user|
  user.posts.each do |post|
    comment = Comment.create(body: "comment on #{post.title}")
    post.comments << comment
    comment.user_id = rand(1..5)
    comment.save
  end
end