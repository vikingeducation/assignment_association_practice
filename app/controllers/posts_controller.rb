class PostsController < ApplicationController
  
  def new
    @post = Post.new
    @categories = Category.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
      flash[:success] = "Post created sucessfully"
    else
      render :show
      flash[:error] = "Post not created"
    end
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post
      flash[:success] = "Post updated sucessfully"
    else
      render :edit
      flash[:error] = "Post not updated"
    end
  end


private
  def post_params
    params.require(:post).permit(:title, :body, :category_id, {:tag_ids => []})
  end


end
