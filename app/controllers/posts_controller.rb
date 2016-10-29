class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @tag_options = Tag.all.map{ |tag| [tag.name, tag.id] }
  end

  def create
    @post = Post.new(whitelisted_post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @tag_options = Tag.all.map{ |tag| [tag.name, tag.id] }
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(whitelisted_post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def whitelisted_post_params
    params.require(:post).permit(:title, :body, :category_id, :tag_ids => [])
  end

end
