class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(secret_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

private

  def secret_params
    params.require(:post).permit(:title, :body, :tag_ids => [])
  end


end
