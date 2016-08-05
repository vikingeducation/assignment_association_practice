class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show 
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Good job."
      redirect_to post_path(@post)
    else
      flash.now = "oops."
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:sucess] = "It saved the update."
    redirect_to post_path(@post)
    else
      flash.now = "It did not save the update."
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :tag_ids => [])
  end
end
