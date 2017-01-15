class PostsController < ApplicationController

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Success!"
      redirect_to post_path(@post)
    else
      flash[:danger] = "Error!"
      redirect_to(:back)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.save(post_params)
      flash[:success] = "Success!"
      redirect_to post_path(@post)
    else
      flash[:danger] = "Error!"
      redirect_to(:back)
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :tag_ids => [])
  end

end
