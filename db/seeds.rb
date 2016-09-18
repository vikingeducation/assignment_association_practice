User.delete_all
Post.delete_all
Category.delete_all
Comment.delete_all
Tag.delete_all

MULTIPLIER = 10

MULTIPLIER.times do
  User.create(name: Faker::Name.name)
end

(MULTIPLIER/2).times do
  Category.create(name: Faker::Book.genre)
end

User.all.each do |u|
  3.times do
    u.authored_posts << Post.new(title: Faker::Lorem.word,
                                    body: Faker::Lorem.paragraph,
                                    category_id: Category.pluck(:id).sample)
  end
end

Post.all.each do |p|
  3.times do
    p.tags << Tag.new(name: Faker::Hipster.word)
  end
end

(MULTIPLIER*10).times do
  Comment.create(body: Faker::Lorem.sentence(3), user_id: User.pluck(:id).sample,
                 post_id: Post.pluck(:id).sample)
end

