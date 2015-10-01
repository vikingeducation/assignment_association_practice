class PostsController < ApplicationController
  
  
  def index
    @posts = Post.all
  end
  
  def edit
    @post = Post.find(params[:id])
    @category_selection = Category.all.map{|c| [c.name, c.id]}
  end
  
  def new
    @post = Post.new
    @category_selection = Category.all.map{|c| [c.name, c.id]}
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render "edit"
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render "edit"
    end
  end
  
private
  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :category_id,
      :tag_ids => [],
      :category_id => [])
  end
end
