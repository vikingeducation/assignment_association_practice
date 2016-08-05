# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do | i |
  User.create!(:name => "user_#{i}")
end

5.times do | i |
  Category.create!(:name => "category_#{i}")
end

5.times do | i |
  Category.find(i+1).posts.build(:title => "post_#{i}", :body => "body for post_#{i}").save
end

5.times do | i |
  c = Comment.create!(:body => "body_#{i}", 
                      user_id: i+1,
                      post_id: i+1)
  User.find(i+1).authored_comments << c
  Post.find(i+1).comments << c
end

5.times do | i |
  Tag.create!(name: "tag_#{i}")
end

5.times do | i |
  ut = UserPost.create!(user_id: i+1,
                        post_id: i+1)
  User.find(i+1).post_authorings << ut
  Post.find(i+1).post_authorings << ut
end

5.times do | i |
  pt = PostTagging.create!(post_id: i+1,
                           tag_id: i+1)
  Post.find(i+1).post_taggings << pt
  Tag.find(i+1).post_taggings << pt
end
