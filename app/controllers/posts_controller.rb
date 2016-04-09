class PostsController < ApplicationController

  def edit
    @page_header = "Edit Post #{@post.id}: #{@post.name}"
  end

  def index
    @column_headers = ["ID", "Title", "Tags", "Show", "Edit"]
    @posts = Post.all
  end

  def new
  end

  def show
    @page_header = "Post #{@post.id}: #{@post.name} "
  end

end
