class PostsController < ApplicationController


  def index
    @posts = Post.all
  end


  def new
    @post = Post.new
    @tag_options = Tag.all.map {|t| [t.name, t.id]}
  end


  def create
    @post = Post.new(whitelisted_params)
    if @post.save
      flash[:success] = "Post saved successfully"
      redirect_to post_path(@post)
    else
      flash[:danger] = "Post NOT saved"
      render :new
    end
  end


  def edit
    @post = Post.find(params[:id])
    @tag_options =  Tag.all.map {|t| [t.name, t.id]}
  end


  def update
    @post = Post.find(params[:id])
    if @post.update(whitelisted_params)
      flash[:success] = "Post updated successfully"
      redirect_to post_path(@post)
    else
      flash[:danger] = "Post NOT updated"
      render :edit
    end
  end


  def show
    @post = Post.find(params[:id])
    @tag_options =  Tag.all.map {|t| [t.name, t.id]}

  end


private

  def whitelisted_params
    params.require(:post).permit(:id, :title, :body, :category_id, tag_ids: [])
  end


end
