class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @comment = @post.comments.build
  end

  def create
    @post = Post.new(whitelisted_post_params)
    if @post.save
      redirect_to post_path(@post)
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
    if @post.update(whitelisted_post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def whitelisted_post_params
    params.require(:post).permit(:title,
                                 :body,
                                 :category_id,
                                 :tag_ids => [],
                                 :comments_attributes => [
                                     :id,
                                     :body,
                                     :user_id,
                                     :post_id,
                                     :_destroy ] )
  end

end
