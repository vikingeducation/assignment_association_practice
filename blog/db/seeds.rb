# seeds.rb

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# You'll see little puts statements in the file to give you status updates as the file runs.
puts "Destroying old records"

# Blow away all the existing records every time.


Category.destroy_all
Comment.destroy_all
PostTag.destroy_all
UserPost.destroy_all
Post.destroy_all
User.destroy_all
Tag.destroy_all


puts "Old records destroyed -- generating new seed records ...\n"

# First generate records for parent models. 
# Call methods to generate child and/or M-to-M model records.

def generate_category
  5.times do |instance|
    category = Category.new
    category.save
    category[:name] = "FooCategoryName_" + category.id.to_s        
    category.save
  end
end

def generate_user
  25.times do |instance|
    user = User.new
    user.save
    user[:name] = "FooUserName_" + user.id.to_s        
    user.save
  end
end

def generate_tag  # assume limited number of tags 
  10.times do |instance|
    tag = Tag.new
    tag.save
    tag[:name] = "FooTagName_" + tag.id.to_s           
    tag.save
  end
end


def generate_post
  50.times do |instance|
    post = Post.new   
    post[:category_id] = Category.pluck(:id).sample 
    post.save
    post[:title] = "FoopostTitle_" + post.id.to_s
    post[:body] = "FoopostBody_" + post.id.to_s               
    post = post.save
  end
end

# Then generate records for child and/or M-to-M models

def generate_user_post 
  # generate average of 2 users per post = 100 combinations
  (Post.all.count * 2).times do |instance|
    user_post = UserPost.new
    user_post[:user_id] = User.pluck(:id).sample
    user_post[:post_id] = Post.pluck(:id).sample           
    user_post.save
  end
end

def generate_post_tag 
  # generate up to 2 tags per post = 200 combinations
  (Post.all.count * 5).times do |instance|
    post_tag = PostTag.new
    post_tag[:post_id] = Post.pluck(:id).sample
    post_tag[:tag_id] = Tag.pluck(:id).sample          
    post_tag.save
  end
end

# Comments: generate with randomly selected author_id and post-id
# Thus some users and posts may be associated with comments ranging from none -> few -> many
# Assume average of 2 comments per post -> assign Posts.all.count * 2

def generate_comment
  (Post.all.count * 2).times do |instance|
    comment = Comment.new    
    comment[:author_id] = User.pluck(:id).sample               
    comment[:post_id] = Post.pluck(:id).sample
    comment.save
    comment[:body] = "FooCommentBody_" + comment.id.to_s  
    comment.save
  end
end



# Now, at last, we are going to run all these methods to create our data!

puts "Creating categories ..."
generate_category
puts "Creating users ..."
generate_user
puts "Creating tags ..."
generate_tag
puts "Creating posts ..."
generate_post
puts "Creating user_posts ..."
generate_user_post
puts "Creating post_tags ..."
generate_post_tag
puts "Creating comments ..."
generate_comment

puts "DONE!"






