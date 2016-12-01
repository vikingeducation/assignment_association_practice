# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  Category.create({
    name: Faker::Beer.style
  })

  # tags
  tags = Tag.create({
    name: Faker::StarWars.planet,
    })
end


30.times do
  user = User.create({
    name: Faker::Name.name
  })

  3.times do
    #posts
    post = user.posts.create({
      title: Faker::Hipster.sentence(3),
      body: Faker::Hipster.paragraph(3),
      category_id: Category.all.sample.id
      })

    5.times do
      # comments
      post.comments.create({
        body: Faker::Hipster.paragraph(3),
        user_id: User.all.sample.id
        })
    end
  end
end

# populate posts_tags join table
Post.all.each do |post|
  rand(3..5).times do
    post_tag = Tag.all.sample
    next if post.tags.include? (post_tag)
    PostTag.create({
      tag_id: post_tag.id,
      post_id: post.id
    })
  end
end
