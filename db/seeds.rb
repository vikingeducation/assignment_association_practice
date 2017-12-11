require 'faker'

Post.destroy_all
User.destroy_all
Tag.destroy_all
Category.destroy_all


MULTIPLIER = 1

10.times do
  Category.create!(name: Faker::Commerce.unique.department(1))
end

(MULTIPLIER * 10).times do
  Tag.create!(name: Faker::Lorem.unique.words(1).first)
end

(MULTIPLIER * 5).times do
  u = User.create!(name: Faker::Name.unique.first_name)

  (MULTIPLIER * 5).times do
    p = u.authored_posts.create!({
      title: Faker::Lorem.unique.sentence,
      body: Faker::Lorem.paragraphs.join(''),
      category_id: Category.all.sample.id
      })

    (0..5).to_a.sample.times do
      p.taggings.create!(tag_id: Tag.all.sample.id)
    end

    (0..5).to_a.sample.times do
      p.comments.create!(body: Faker::Lorem.paragraph, user_id: User.all.sample.id)
    end
  end #posts
end #users


# Adds more authors to posts
Post.all.each do |p|
  (0..3).to_a.sample.times do
    available_authors = User.where('id NOT IN (?)', p.users.pluck(:id))
    p.user_posts.create!(user_id: available_authors.sample.id)
  end
end
