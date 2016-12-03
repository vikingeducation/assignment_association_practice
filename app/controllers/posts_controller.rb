class PostsController < ApplicationController
  def new
    @post = Post.new
    @comment = @post.comments.build
    @category_options = Category.all.map{|c| [ c.name, c.id ] }
    @tag_options = Tag.all.map{ |t| [ t.name, t.id ]}.push([ "No tag", nil])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash.now[:error] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
    @category_options = Category.all.map{|c| [ c.name, c.id ] }
    @tag_options = Tag.all.map{ |t| [ t.name, t.id ]}.push([ "No tag", nil])
    @comment = @post.comments.build
  end

  def index
    @posts = Post.all
  end

  def update
    p "post_params:"
    p post_params
    @post = Post.find_by_id(params[:id])
    if @post.update(post_params)
      flash[:success] = ["Nice, you updated a post"]
      redirect_to @post
    else
      flash.now[:error] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :category_id,
      :tag_ids => [],
      :comments_attributes => [ :body, :id, :_destroy ] )
  end
end
