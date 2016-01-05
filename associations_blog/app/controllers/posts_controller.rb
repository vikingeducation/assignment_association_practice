class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
