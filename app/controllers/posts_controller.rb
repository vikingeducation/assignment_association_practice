class PostsController < ApplicationController

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "#{ @post.title } Created!"
      redirect_to @post
    else
      flash[:danger] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def udpate
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "#{ @post.title } Edited!"
      redirect_to @post
    else
      flash[:danger] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :category_id, tag_ids: [])
    end
end
