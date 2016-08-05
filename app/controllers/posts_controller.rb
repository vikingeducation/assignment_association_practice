class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @post.comments.build
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
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
      redirect_to @post
    else
      render :edit
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :category_id, :tag_ids => [], :comments_attributes => [:body, :id, :_destroy])
    end

end
