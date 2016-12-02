class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post successfully created!"
      redirect_to post_path(@post)
    else
      flash.now[:error] = "Check your fields again"
      render :new
    end
  end

  def edit
    @post = Post.find_by_id(post_params)
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post successfully updated!"
      redirect_to post_path(@post)
    else
      flash.now[:error] = "Check your fields again"
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :tag_ids => [])
  end

end
