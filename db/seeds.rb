# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Build a dead-simple Seeds file which creates several Users, Posts, Comments,
# Categories and Tags. Make sure that the Comments each have authors and are
# attached to a Post. Don't go crazy -- just a handful of each is fine and don't
# worry about randomness or creativity. "foouser23" is a perfectly valid name
# and it's fine to make every User author exactly 5 Posts.
def unique(x)
  x + rand(0..999_999_999).to_s
end


# reset the db
User.destroy_all
Post.destroy_all
Comment.destroy_all
Category.destroy_all
Tag.destroy_all
PostTag.destroy_all
UserPost.destroy_all

# create users
5.times do
  User.create(
    :name => unique(Faker::Name.name)
  )
end

# create categories
10.times do
  Category.create(
    :name => unique(Faker::Lorem.word)
  )
end

# create tags
10.times do
  Tag.create(
    :name => unique(Faker::Lorem.word)
  )
end

# create posts
20.times do
  # create posts
  Post.create(
    :title => unique(Faker::Lorem.sentence),
    :body => unique(Faker::Lorem.paragraphs.join("\n")),
    :category_id => Category.pluck(:id).sample
  )
  # create users posts
  u, p = User.all.sample, Post.all.sample
  u.posts << p unless u.posts.include?(p)
  # create posts tags
  p, t = Post.all.sample, Tag.all.sample
  p.tags << t unless p.tags.include?(t)
end

# create comments
40.times do
  Comment.create(
    :body => Faker::Lorem.paragraph,
    :user_id => User.pluck(:id).sample,
    :post_id => Post.pluck(:id).sample
  )
end
