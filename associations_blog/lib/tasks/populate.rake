namespace :db do
  desc 'Clear the database and fill with excellent fake data'
  task :populate => :environment do
    require 'populator'
    require 'faker'

    # Blow away the existing data
    tables = [User, Category, Post, PostAuthor]

    tables.each do |table|
      table.destroy_all
      # ActiveRecord::Base.connection.reset_pk_sequence!(table.table_name)
    end

    Category.populate(5) do |category|
      category.name = Faker::Commerce.department(1)

      Post.populate(10) do |post|
        post.category_id = category.id
        post.title = Faker::Company.catch_phrase
        post.body = Faker::Lorem.paragraph
      end
    end

    User.populate(10) do |user|
      user.name = Faker::Name.name
    end

    Post.all.each do |post|
      PostAuthor.populate(1..2) do |author|
        author.post_id = post.id
        author.author_id = User.pluck(:id).sample
      end
    end

  end
end

