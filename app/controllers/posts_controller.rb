class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @comments = @post.comments.build
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

    if @post.update!(whitelisted_post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      flash[:error] = "Nope :("
      render :edit
    end


  end

  private

  def whitelisted_post_params
    params.require(:post).permit(:title, :body, :category_id, {:tag_ids => []},  {:comments_attributes => [:id, :body, :user_id, :_destroy]} )
  end
end
