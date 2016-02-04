
namespace :verify do
  desc "TODO"
  task db: :environment do
    def p(thing)
      puts Hirb::Helpers::AutoTable.render(thing)
    end
    Hirb.enable
    p "List all Users, Comments, Posts, Categories or Tags."
    p User.all
    p Comment.all
    p Post.all
    p Category.all
    p Tag.all

    p "List a given user's comments"
    User.all.sample.authored_comments

    p "Set a comment to belong to a different user"
    Comment.all.sample.update(author: User.all.sample)

    p "Set a post to be in a different category"
    p "first category: #{Post.all.sample.category}"
    pt = Post.all.sample
    pt.category = Category.all.sample
    pt.save
    p "second category: #{pt.category}"

    p "Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])"
    p User.first.authored_comments = [Comment.first, Comment.second]

    p "Set a comment's author to be a different user"
    p Comment.first.update(author: User.all.sample)

    p "Return a given comment's author"
    p Comment.all.sample.author

    p "List a given post's comments"
    Post.all.sample.comments

    p "Return a given comment's parent post"
    Comment.all.sample.parent_post

    p "Remove one post from a category's collection of posts"
    post = Category.first.posts.first
    p "post before: #{post}"
    Category.first.posts.delete(post)
    p "post after: #{post}"

    p "List the posts authored by a given user"
    p User.all.sample.authored_posts

    p "List the IDs of all posts authored by a given user (hint: there's an association method for this)"
    p User.first.authored_post_ids

    p" Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]"
    p User.all.sample.authored_posts = [Post.first, Post.second]

    p "List the authors of a given post"
    p Post.all.sample.authors

    p "Set a collection of Users to replace a given Post's authors in a similar way"
    p Post.all.sample.authors = [User.first, User.second]

    p "Accomplish the same thing by only using IDs (hint: there's an association method for this...)"
    p Post.all.sample.author_ids = Post.all.sample.author_ids

    p "List the posts under a given tag"
    p Tag.all.sample.tagged_posts

    p "Add a new post to a given tag by only using its ID"
    tag = Tag.all.sample
    p "before: #{tag.tagged_posts}"
    tag.tagged_post_ids += [Post.all.sample.id]
    p "after #{tag.tagged_posts}"

    p "Add a new tag to a given post by only using its ID"
    post = Post.first
    post.tag_ids += [Tag.all.sample.id]
    post.tags

    p "List the tags on a given post"
    p Post.all.sample.tags


  end

end
