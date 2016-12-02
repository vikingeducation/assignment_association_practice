# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


NAMES = ["Anthony", "Erik", "Alexa", "Catherine", "Dexter", "JP", "Kenny", "James"]
CATEGORIES = ["fishing", "dancing", "coding"]
TAGS = ["Tag 1", "Tag 2", "Tag 3"]
POST_CONTENT = ["Post body 1", "Post body 2", "Post body 3"]
COMMENT_CONTENT = ["Comment 1", "Comment 2", "Comment 3"]

#populates categories table
CATEGORIES.each do |cat|
  Category.create(name: cat)
end

#populates tags table
TAGS.each do |tag|
  Tag.create(name: tag)
end

#creates a user, the user's posts, the post's category
NAMES.each do |name|

  a = User.create(name: name)
  b = a.posts.create(title: POST_CONTENT.sample, body: POST_CONTENT.sample)
  c = b.category = Category.find_by_name(CATEGORIES.sample)

  b.save

  PostTag.create(post: b, tag: Tag.find_by_name(TAGS.sample))

end

Post.all.each do |post|
  user1 = User.all.sample
  user2 = User.all.sample
  c1 = user1.comments.create(body: COMMENT_CONTENT.sample, post: post)
  c2 = user2.comments.create(body: COMMENT_CONTENT.sample, post: post)
end
