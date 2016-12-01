# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
NUM = 5
$users = []
$posts = []
def create_users(num)
  num.times do
    $users << User.create(name: Faker::Name.name)
  end
end

def create_categories(num)
  Category.create( name: Faker::Lorem.word)
end



def create_posts(num)
  category_ids = Category.pluck(:id)
  num.times do
    $posts << Post.create( title: Faker::Lorem.sentence,
                  body:  Faker::Lorem.paragraph,
                  category_id: category_ids.sample)
  end
end

def create_comments(num)
  users = User.pluck(:id)
  $posts.each do |post|
    num.times do
      Comment.create( body: Faker::Lorem.sentence,
                      author_id: users.sample,
                      post_id: post.id)
    end
  end
end

def create_tags(num)
  Tag.create(name: Faker::Lorem.word)
end

def popluate_post_tags(num)
  posts = Post.pluck(:id)
  tags = Tag.pluck(:id)
  num.times do |n|
    post_id = posts.sample
    tag_id = tags.sample
    pt = PostTags.new(post_id: post_id , tag_id: tag_id )
    if PostTags.where(:post_id => post_id, :tag_id => tag_id).empty?
      pt.save
    end
  end
end

def popluate_post_users(num)
  posts = Post.pluck(:id)
  users = User.pluck(:id)
  num.times do |n|
    post_id = posts.sample
    author_id = users.sample
    pt = PostUsers.new(post_id: post_id , author_id: author_id )
    if PostUsers.where(:post_id => post_id, :author_id => author_id).empty?
      pt.save
    end
  end
end


# def generate_users(post_id)
#   (rand(10) + 1).times do
#   pt = PostTags.new
#   pt[:order_id] = post_id
#   pt[:product_id] = Product.pluck(:id).sample
#
#   # prevents breaking the uniqueness constraint on
#   # [:order_id, :product_id]
#   if OrderContent.where(:product_id => c.product_id,
#     :order_id => c.order_id).empty?
#     c.save
#     end
#   end
# end




puts "Erasing prior databas"

User.destroy_all
Post.destroy_all
Comment.destroy_all
Tag.destroy_all

puts "All Destroyed"

puts "Creating Users"

create_users NUM

puts "Creating Posts"

create_posts NUM

puts "Creating Comment"

create_comments NUM

puts "Creating Categories"

create_categories NUM

puts "Creating Tags"

create_tags NUM
