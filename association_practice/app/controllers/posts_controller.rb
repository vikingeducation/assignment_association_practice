class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Create worked"
      redirect_to @post
    else
      flash[:alert] = "Create didn't work"
      render :new
    end
  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
  end

private
  def post_params
    params.require(:post).permit(:title, :body, :category_id, :tag_ids => [] )
  end
end
