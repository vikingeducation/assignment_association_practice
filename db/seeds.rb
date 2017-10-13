# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
1.upto(10) do |i|
  User.create name: "foouser#{i}"
end

@users = User.all

# Categories
1.upto(9) do |i|
  Category.create name: "Category #{i}"
end

@categories = Category.all

# Posts
@users.each do |u|
  1.upto(5) do |i|
    p = Post.create title: "foouser#{u.id} post #{i}",
                    body: "Some words for foouser#{u.id}'s post number #{i}.",
                    category_id: @categories.sample.id

    UserPost.create user_id: u.id, post_id: p.id
  end
end

@posts = Post.all

# Comments

25.times do |i|
  user = @users.sample
  post = @posts.sample

  Comment.create(
    body: "A comment from foouser#{user.id} on post: #{post.title}.",
    user_id: user.id,
    post_id: post.id
  )
end

# Tags

1.upto(18) do |i|
  Tag.create name: "Tag #{i}"
end

@tags = Tag.all

# Tag posts

50.times do
  begin
    PostTagging.create post_id: @posts.sample.id,
                       tag_id: @tags.sample.id
  rescue
    retry
  end
end