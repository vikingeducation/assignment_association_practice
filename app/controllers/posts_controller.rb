class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @category_options = Category.all.map{|cat| [cat.name, cat.id]}
    @post = Post.new
  end

  def create
    @post = Post.new(safe_post_params)
    if @post.save
      flash[:success] = "New post created"
      redirect_to posts_path
    else
      flash[:error] = "Post creation failed"
      render :new
    end
  end

  def edit
    @post  = Post.find(params[:id])
  end

  def update
    if @post.update_attributes(safe_post_params)
      flash[:success] = "Post updated"
      redirect_to 'show'
    else
      flash[:error] = "Post update failed"
      render :edit
    end
  end

  private
  def safe_post_params
    params.require(:post).permit(:title, :body, :category_id, :tags_id)
  end

end
