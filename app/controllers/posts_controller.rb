class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @comment = @post.comments.build
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = "Post successfully created!"

      redirect_to @post
    else
      flash.now[:error] = "Could not create your crappy post!"

      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = "Post successfully updated!"
      redirect_to @post
    else
      flash.now[:error] = "Could not update your crappy post!"
      
      render :edit
    end
  end

  def destroy

  end

  private

  def post_params
    params
      .require(:post)
      .permit(:title, :body, :category_id, 
        { :comments_attributes => [:body] }, :tag_ids => [] )
  end

end
