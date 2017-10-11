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
    @post.comments.build
  end

  def update
    @post = Post.find(params[:id])
    # binding.pry
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

    # need to be able to whitelist the :id attribute as well (otherwise you'll create a new record every time).
    params.require(:post).permit(
      :title, 
      :body, 
      :category_id, 
      {:tag_ids => []},
      { :comments_attributes => [
                   :body,
                   :author_id,
                   # :post_id,
                   :id,
                   :_destroy ] } )
  end


end
