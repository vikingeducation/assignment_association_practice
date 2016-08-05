class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.new(whitelisted_post_params)
  end






  private


  def whitelisted_post_params
    params.require(:post).permit(:title, :body, :tag_ids => [])
  end
end
