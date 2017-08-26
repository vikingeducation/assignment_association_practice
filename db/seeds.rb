# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying data"

User.destroy_all
Post.destroy_all
Category.destroy_all
Comment.destroy_all

puts "data destroyed"


MULTIPLIER = 20

def generate_name
	u = User.new
	u[:name] = Faker::Name.name
	u.save!
end

def generate_post
	#user = User.all.sample
	p = Post.new
	p[:title] = Faker::Lorem.word.capitalize
	p[:body] = Faker::Lorem.sentence
	p[:user_id] = User.pluck(:id).sample
	p.save!
end

def generate_category
	c = Category.new
	c[:name] = Faker::Lorem.word.capitalize
	c[:post_id] = Post.pluck(:id).sample
	c.save
end

def generate_comments
	user = User.all
	post = Post.all
	c = Comment.new
	c[:body] = Faker::Lorem.sentence
	c[:user_id] = user.pluck(:id).sample
	c[:post_id] = post.pluck(:id).sample
	c.save 
end


MULTIPLIER.times { generate_name }
puts "created name"

MULTIPLIER.times { generate_post }
puts "created post"

MULTIPLIER.times { generate_category }
puts "created category"

MULTIPLIER.times { generate_comments }
puts "created comments"