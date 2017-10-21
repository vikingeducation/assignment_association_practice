class PostsController < ApplicationController

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @categories = Category.all.map {|obj| [obj.name, obj.id]}
    @tag_options = Tag.all.map {|obj| [obj.name, obj.id]}
    @comment = @post.comments.build
  end

  def create
    @post = Post.new(whitelisted_post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to @post
    else
      flash.now[:danger] = "ERROR!! Post hasn't been created." + @post.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all.map {|obj| [obj.name, obj.id]}
    @tag_options = Tag.all.map {|obj| [obj.name, obj.id]}
    @post.comments.build
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(whitelisted_post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      flash.now[:danger] = "ERROR!! Post hasn't been created." + @post.errors.full_messages.join(', ')
      render 'edit'
    end
  end

  private
  def whitelisted_post_params
    params.require(:post).permit(:title, :body, :category_id, {:tag_ids => []}, {:comments_attributes => [:comment, :post_id, :user_id, :id, :_destroy] })
  end

end
