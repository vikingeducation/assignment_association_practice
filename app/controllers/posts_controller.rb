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
    @comments = @post.comments.build
    @page_header = "Edit Post #{@post.id}: #{@post.title}"
    @tag_options = Tag.all.map{ |tag| [tag.name,tag.id] }
  end

  def index
    @column_headers = ["ID", "Title", "Category", "Tags", "Show", "Edit"]
    @posts = Post.all
  end

  def new
    @post = Post.new
    @comment = @post.comments.build
    @tag_options = Tag.all.map{ |tag| [tag.name,tag.id] }
  end

  def show
    @post = Post.find(params[:id])
    @page_header = "Post #{@post.id}: #{@post.title} "
    @tags = @post.tags.map{|tag| tag.name}.join(", ")
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(whitelisted_params)
      redirect_to @post
    else
      render :new
    end
  end

  private

  def whitelisted_params
    params.require(:post).permit(:title,
                                 :body, 
                                 :category_id, 
                                 :tag_ids => [],
                                 :comments_attributes => [:body, :id, :user_id, :post_id, :_destroy] )
  end

end
