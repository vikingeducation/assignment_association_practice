class PostsController < ApplicationController

  def edit
    @page_header = "Edit Post #{@post.id}: #{@post.title}"
  end

  def index
    @column_headers = ["ID", "Title", "Tags", "Show", "Edit"]
    @posts = Post.all
  end

  def new
  end

  def show
    @post = Post.find(params[:id])
    @page_header = "Post #{@post.id}: #{@post.title} "
    @tags = @post.tags.map{|tag| tag.name}.join(", ")
  end

end
