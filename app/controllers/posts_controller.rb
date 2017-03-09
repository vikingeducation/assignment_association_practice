class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(whitelisted_post_params)
    if @post.save!
      flash[:success] = "Post saved!"
      redirect_to @post
    else
      fd
      flash[:error] = "Post NOT saved :("
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(whitelisted_post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      flash[:error] = "Nope :("
      render :edit
    end


  end

  private

  def whitelisted_post_params
    params.require(:post).permit(:title, :body, {:tag_ids => []}, :category_id)
  end
end
