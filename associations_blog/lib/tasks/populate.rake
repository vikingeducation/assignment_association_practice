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

    User.populate(10) do |user|
      user.name = Faker::Name.name
    end

    Tag.populate(15) do |tag|
      tag.name = Faker::Company.buzzword
    end

    Category.populate(5) do |category|
      category.name = Faker::Commerce.department(1)

      Post.populate(10) do |post|
        post.category_id = category.id
        post.title = Faker::Company.catch_phrase
        post.body = Faker::Lorem.paragraph

        Comment.populate(5) do |comment|
          comment.post_id = post.id
          comment.author_id = User.pluck(:id).sample
          comment.body = Faker::Lorem.sentence
        end

        PostTag.populate(1..3) do |ptag|
          ptag.post_id = post.id
          ptag.tag_id = Tag.pluck(:id).sample
        end
      end
    end

    Post.all.each do |post|
      PostAuthor.populate(1..2) do |author|
        author.post_id = post.id
        author.author_id = User.pluck(:id).sample
      end
    end

  end
end

