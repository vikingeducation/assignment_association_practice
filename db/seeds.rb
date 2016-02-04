# This file should contain all the record creation needed to seed the database with its default values.# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

Comment.destroy_all
Post.destroy_all
Category.destroy_all
Tag.destroy_all
User.destroy_all

10.times do |i|
  User.create(name: "User #{i}")
end

10.times do |i|
  Category.create(name: "Category #{i}")
end

User.find_each do |user|
  5.times do |index|
    post = user.posts.create(title: "Title #{index}", body: "Body #{index}", category: Category.all.sample)
    3.times do |comment_index|
      post.comments.create(body: "Body #{comment_index}", user: User.all.sample)
      post.tags.create(name: "Tag #{comment_index}")
    end
  end
end

Tag.find_each do |tag|
  Post.all.sample.tags << tag
end

Post.find_each do |post|
  User.all.sample.posts << post
end
