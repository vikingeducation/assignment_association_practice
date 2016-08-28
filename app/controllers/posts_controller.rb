class PostsController < ApplicationController

  def index
    @posts = Post.all.order("created_at desc")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(white_list_params)
    if @post.save
      flash[:success] = ["Post: #{@post.id} is saved!"]
      redirect_to post_path(@post)
    else
      flash[:danger] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(white_list_params)
      flash[:success] = ["Post: #{@post.id} is saved!"]
      redirect_to post_path(@post)
    else
      flash[:danger] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def white_list_params
      params.require(:post).permit(:title, :body, :category_id, :tag_ids => [])
    end
end
