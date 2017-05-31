class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post.comments.build
  end

  def new
    @post = Post.new
    @comment = @post.comments.build
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @post.comments.build
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def post_params
    params.require(:post).permit(
      :title, :body, {:tag_ids => []}, :category_id,
      {:comments_attributes => [:id, :body, :user_id, :_destroy]}
    )
  end


end
