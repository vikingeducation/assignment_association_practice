class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash.now[:error] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find_by(params[:id])
  end

  def index
    @posts = Post.all
  end

  def update
    p "post_params:"
    p post_params
    if @post = Post.update(post_params)
      flash[:success] = ["Nice, you updated a post"]
      redirect_to post_path
    else
      flash.now[:error] = @post.errors.full_messages
      render :update
    end
  end

  def show
    @post = Post.find_by(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :tag_ids => [])
  end
end
