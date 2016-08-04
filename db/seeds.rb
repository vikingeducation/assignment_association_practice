#
# User
#   name
# Post
#   title
#   body
# Category
#   name
# Comment
#   body
# Tag
#   name
puts "destroying all"
Post.destroy_all
Tag.destroy_all
PostTag.destroy_all
User.destroy_all
Comment.destroy_all
UserPost.destroy_all
Category.destroy_all
puts "creating seed"
10.times do
  u = User.create!(name: Faker::Name.name)
  5.times do
    post = u.posts.create(title: Faker::Hipster.word, body: Faker::Hipster.sentence)
    post.comments.create(body: Faker::Team.name)
    post.create_category(name: Faker::Book.genre)
    post.tags.create(name: Faker::App.name)
  end

end
puts "finished!"
