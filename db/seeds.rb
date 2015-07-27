# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Users

20.times do |n|
  u = User.create(:name => "fooUser#{n}")      #creating 20 users
  5.times do |i|
  	new_post = u.posts.create(:title => "Post#{i}", :body => "Lorem Ipsum...")     #creating 5 posts per user
  	# u.posts << new_post
  		2.times do |f|
  			new_post.comments.create(:body => "Hi! I'm comment #{f} on post #{i}")   #creating 2 comments per post
  			if f%2 == 0     #creating 1 tag per post
  				new_post.tags.create(:name => "Lorem")
  			else
  				new_post.tags.create(:name => "Ipsum")
  			end
  		end
  end
end