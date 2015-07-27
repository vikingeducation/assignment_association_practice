# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Post.destroy_all
Comment.destroy_all
Tag.destroy_all
UserPosting.destroy_all
PostTagging.destroy_all

users = []
5.times do |i|
  users << User.create(name: "foo#{i}")
end

users.each do |user|
  5.times do |i|
    user.posts.create(title: "Post#{i} of #{user.name}", body: "post body #{i} of #{user.name}")
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

Post.all.each do |post|
  tag = Tag.create(name: "Tag for #{post.title}")
  post.tags << tag
  post.users << User.all.sample
  # tag.posts << post
end

Tag.all.each do |tag|
  tag.posts << Post.all.sample
end

