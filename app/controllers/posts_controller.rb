class PostsController < ApplicationController

  def index
  end

  def show
    @post = Post.find_by_id(post_params)
  end

  def new
    @post = Post.new
  end

  def create
  end

  def edit
    @post = Post.find_by_id(post_params)
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :tag_ids => [])
  end

end
