class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.comments.build
  end

  def create
    @author_options = User.all
    @post = Post.new(whitelist_post_params)
    if @post.save
      flash[:notice] = "Post #{@post.title} successfully created!"
      redirect_to @post
    else
      flash[:notice] = "Post failed to be created, try again."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @post.comments.build
  end

  def update
    @author_options = User.all
    @post = Post.find(params[:id])
    if @post.update(whitelist_post_params)
      flash[:notice] = "Post #{@post.title} successfully edited!"
      redirect_to @post
    else
      flash[:notice] = "Post failed to be edited, try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

    def whitelist_post_params
      params.require(:post).permit(:title, :body, {author_ids: [], tag_ids: [], :comments_attributes => [:id, :body, :_destroy]})
    end
end
