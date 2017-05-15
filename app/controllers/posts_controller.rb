class PostsController < ApplicationController

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(whitelisted_post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to post_path
    else
      flash.now[:danger] = "ERROR!! Post hasn't been created."
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(whitelisted_post_params)
      flash[:success] = "Post created"
      redirect_to post_path
    else
      flash.now[:danger] = "ERROR!! Post hasn't been created."
      render 'edit'
    end
  end

  private
  def whitelisted_post_params
    params.require(:post).permit(:title, :body)
  end

end
