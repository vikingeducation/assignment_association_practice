# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Comment.destroy_all
Post.destroy_all
Category.destroy_all
Tag.destroy_all

multiplier = 10

multiplier.times do |n|
  user = User.create(
    name: "user#{n}")


  (multiplier/2).times do |m|
    post = user.posts.create(
      title: "title#{m}",
      body: "Some long blurb #{m}"
     )

    # post.users << user

    # post.user_id = user.id
    # post.save

    3.times do |comment_num|
      p post
      comment = post.comments.create(body: "comment body #{comment_num}")
      comment.author = user
      comment.save
    end

    3.times do |tag_num|
      post.tags.find_or_create_by(name: "tag #{tag_num}")

    end

    post.update(category: Category.find_or_create_by(name: "category#{[1, 2, 3].sample}"))


  end

end

puts "users created"

