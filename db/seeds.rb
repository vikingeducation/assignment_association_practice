# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "destroy_all old records"

Category.destroy_all
Comment.destroy_all
Post.destroy_all
Pt.destroy_all
Pu.destroy_all
Tag.destroy_all
User.destroy_all

puts "destroy_all finished"

MULTIPLIER = 10

def category_generate
  #create a new category
  cate = Category.new
  cate.name = Faker::Commerce.department
  cate.save

end

def user_generate
  #create a new user
  user = User.new
  user.name = Faker::Name.name
  user.save

end

def post_generate
  #create a new post
  post = Post.new
  post.title = Faker::Book.title
  post.body = Faker::Lorem.sentence
  post.category_id = Category.pluck(:id).sample
  post.save

end

def pt_generate
  #create post-tag relationship
  pt = Pt.new
  pt.post_id = Post.pluck(:id).sample
  pt.tag_id = Tag.pluck(:id).sample
  pt.save

end

def pu_generate
  #create post-tag relationship
  pu = Pu.new
  pu.post_id = Post.pluck(:id).sample
  pu.user_id = User.pluck(:id).sample
  pu.save

end

def comment_generate
# comment relationship create
  cmt = Comment.new
  cmt.body = Faker::Lorem.sentence
  cmt.user_id = User.pluck(:id).sample
  cmt.post_id = Post.pluck(:id).sample
  cmt.save

end

def tag_generate

  tag = Tag.new
  tag.name = Faker::Lorem.word
  tag.save

end


(MULTIPLIER).times {
  user_generate
  tag_generate
}
puts "generated user and tags"

(MULTIPLIER/2).times {
  category_generate
  puts "generate a category"
}
puts "generated categorys"

(5*MULTIPLIER).times {
  post_generate
}
puts "posts generated"

(10*MULTIPLIER).times {
  comment_generate
}
puts "comments generated"

(10*MULTIPLIER).times {
  pu_generate
  pt_generate
}
puts "pu and pt all set"








