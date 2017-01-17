class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Success!'
      redirect_to post_path(@post)
    else
      flash.now[:warning] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Success!"
      redirect_to @post
    else
      flash.now[:warning] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :tag_ids => [])
  end

end
