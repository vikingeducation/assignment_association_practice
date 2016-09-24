class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(whitelisted_post_params)
    if @post.save
      # Woohoo
      redirect_to @post
    else
      # boohoo
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @post.comments.build(user_id: 1)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(whitelisted_post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    Post.find(params[:id]).destroy!
    redirect_to posts_path
  end


    private

  def whitelisted_post_params
    params.require(:post).permit(:title, :body, :category_id, :tag_ids => [],
                                 :comments_attributes => [:body, :id, :_destroy ])
  end

end
