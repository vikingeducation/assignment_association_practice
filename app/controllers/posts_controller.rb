class PostsController < ApplicationController

  def create
    @post = Post.new(whitelisted_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @page_header = "Edit Post #{@post.id}: #{@post.title}"
  end

  def index
    @column_headers = ["ID", "Title", "Tags", "Show", "Edit"]
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @page_header = "Post #{@post.id}: #{@post.title} "
    @tags = @post.tags.map{|tag| tag.name}.join(", ")
  end

  def update
    @post = Post.new(whitelisted_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  private

  def whitelisted_params
    params.require(:post).permit(:title,:body,:tag_ids => [])
  end

end
