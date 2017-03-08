class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new 
    @categories = Category.all
    @tags = Tag.all
    @users = User.all
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    # fail
    # http://stackoverflow.com/questions/403671/the-differences-between-build-create-and-create-and-when-should-they-be-us
    redirect_to post_path(@post.id)
  end

  def edit
    @categories = Category.all
    @tags = Tag.all
    @users = User.all
    @post = Post.find(params[:id])
  end

  # http://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-update
  def update
    @post = Post.find(params[:id])
    @post.update!(post_params)
    redirect_to post_path(@post.id)
  end

  private

  def post_params
    params.require(:post)
      .permit(:title, :body, :category_id, tag_ids: [], user_ids: [])
  end
end