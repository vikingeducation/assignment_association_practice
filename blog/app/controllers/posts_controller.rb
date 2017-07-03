class PostsController < ApplicationController

  def index
    @posts = Post.all.order(:created_at)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(whitelisted_post_params)
    if post.save
      flash[:success] = "Success! Post created"
      redirect_to @post
    else
      flash.now[:error] = "Error! Post not created"
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
      flash[:success] = "Success! Post updated"
      redirect_to @post
    else
      flash.now[:error] = "Failure! Post not updated"
      render :edit
    end
  end

  def destroy
    Post.find(params[:id]).destroy!
    redirect_to posts_path
  end

  private

  def whitelisted_post_params
    params.require(:post).permit(:title, :body, tag_ids: [])
  end

end

