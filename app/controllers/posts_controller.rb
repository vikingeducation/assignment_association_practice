class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Nice, you created a post"
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
    if @post = Post.update(post_params)
      # flash[:success] = "Nice, you updated a post"
      redirect_to post_path
    else
      flash.now[:error] = @post.errors.full_messages
      render :update
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
