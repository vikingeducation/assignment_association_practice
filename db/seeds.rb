# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Category.destroy_all
Post.destroy_all
Tag.destroy_all
Comment.destroy_all
PostTags.destroy_all
UserPosts.destroy_all

array = Array(0..10)
array.each do |num|
  User.create(:name => "user" + num.to_s)
end

array.each do |num|
  Category.create(:name => "category" + num.to_s)
end

array.each do |num|
  Post.create(:title => "Post Name " + num.to_s, :body => "This is the text and stuff", :category_id => Category.all.sample.id)
end

array.each do |num|
  Tag.create(:name => "#" + num.to_s)
end

array.each do |num|
  Comment.create(:body => "I think we need #{num} seals", :user_id => User.all.sample.id, :post_id => Post.all.sample.id)
end

array.each do |num|
  PostTags.create(:post_id => Post.all.sample.id, :tag_id => Tag.all.sample.id)
  UserPosts.create(:post_id => Post.all.sample.id, :user_id => User.all.sample.id)
end
