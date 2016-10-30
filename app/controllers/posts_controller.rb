class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(white_listed_params)

    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(white_listed_params)
      redirect_to @post
    else
      render "edit"
    end
  end

  private
  def white_listed_params
    params.require(:post).permit(:title, :body, :tag_ids => [])
  end
end
