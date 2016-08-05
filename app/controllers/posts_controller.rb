class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
  end

  def index
    @posts = Post.all
  end
end
