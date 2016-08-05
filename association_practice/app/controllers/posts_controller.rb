class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      flash[:success] = "Create worked"
      redirect_to @post
    else
      flash[:alert] = "Create didn't work"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
     @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Update worked"
      redirect_to @post
    else
      flash[:alert] = "Update didn't work"
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

private
  def post_params
    params.require(:post).permit(:title, :body, :category_id, :tag_ids => [] )
  end
end
