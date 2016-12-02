class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by(params[:id])
  end

  def index
    @posts = Post.all
  end

  def update
    @post = Post.update(post_params)
  end

  private
  def post_params
    params.require(:post).allow(:title, :body)
  end
end
