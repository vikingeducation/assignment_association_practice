class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(whitelisted_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def whitelisted_params
    params.require(:post).permit(
      :title,
      :body, 
      :tag_ids => [])
  end
end
