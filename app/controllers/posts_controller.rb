class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @tags = @post.tags
    @category = @post.category
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(whitelisted_post_params)

    if @post.save
      flash[:success] = "Post successfully created."
      redirect_to @post
    else
      flash.now[:error] = "Error creating Post."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(whitelisted_post_params)
      flash[:success] = "Post successfully updated."
      redirect_to @post
    else
      flash.now[:error] = "Error updating Post."
      render :edit
    end
  end

  private

  def whitelisted_post_params
    params.require(:post).permit(:title, :body, :category_id, tag_ids: [])
  end
end
