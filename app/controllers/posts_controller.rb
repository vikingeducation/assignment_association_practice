class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @tags = @post.tags
  end

  def new
    @post = Post.new
    @tags = Tag.all.order(name: :asc)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Success"
      redirect_to @post
    else
      flash.now[:alert] = "Problem"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Success"
      redirect_to @post
    else
      flash.now[:alert] = "Problem"
      render :edit
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :tag_ids => [])
  end

end
