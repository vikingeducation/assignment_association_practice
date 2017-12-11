require 'faker'

MULTIPLIER = 1

10.times do
  Category.create!(name: Faker::Commerce.unique.department)
end

(MULTIPLIER * 10).times do
  Tag.create!(name: Faker::Lorem.unique.words(1).first)
end

(MULTIPLIER * 3).times do
  User.create!(name: Faker::Internet.unique.user_name)
end

(MULTIPLIER * 3).times do
  p = Post.create!({
    title: Faker::Lorem.unique.sentence,
    body: Faker::Lorem.paragraphs,
    category_id: Category.all.sample.id
    })

  (1..3).to_a.sample.times do
    p.post_authorings.create!(user_id: User.all.sample.id)
  end

  (0..5).to_a.sample.times do
    p.taggings.create!(tag_id: Tag.all.sample.id)
  end

  (0..5).to_a.sample.times do
    p.comments.create!(body: Faker::Lorem.paragraph, user_id: User.all.sample.id)
  end

end

Post.all.each do |p|
  (0..5).to_a.sample.times do
    p.comments.create!(body: Faker::Lorem.paragraph, user_id: User.all.sample.id)
  end
end

