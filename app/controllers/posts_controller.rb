class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.comments.build
    @category_options = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @post = Post.new(whitelisted_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @post.comments.build
    @category_options = Category.all.map{|c| [ c.name, c.id ] }
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(whitelisted_params)
      redirect_to post_path(@post)
    else
      render 'edit'
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
      :category_id,
      :tag_ids => [],
      :comments_attributes => [:body, :id, :_destroy])
  end
end
