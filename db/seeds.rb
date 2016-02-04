# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

4.times do |num|
  user = User.create(name: "FooUser#{num}")

  category = Category.create( name: "Category#{num}" )

  5.times do |post_num|
    post = Post.create( title: "FooPost#{num}-#{post_num}",
                        body: "Bar body", category_id: category.id )

    UserPost.create( post_id: post.id, user_id: user.id )

    2.times do |comment_num|
      comment = Comment.create( body: "Comment body #{comment_num}", post_id: post.id, user_id: user.id )
    end

  end

end

5.times do |tag_num|

  tag = Tag.create( name: "TaggyName#{tag_num}" )

  5.times do |post_tag_num|
    PostTag.create( tag_id: tag.id, post_id: post_tag_num )
  end

end
