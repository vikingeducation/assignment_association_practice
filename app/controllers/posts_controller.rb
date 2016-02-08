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

  def update
    @post = Post.find(params[:id])
    if @post.update(secret_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end


private

  def secret_params
    params.require(:post).permit(:title, :body, :category_id, :tag_ids => [])
  end


end
