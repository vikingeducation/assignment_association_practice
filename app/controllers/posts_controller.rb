class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.comments.build
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    @post.comments.build
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      redirect_to posts_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit( :title,
                                  :body,
                                  :category_id,
                                  :tag_ids => [],
                                  comments_attributes: [
                                    :id,
                                    :body,
                                    :post_id,
                                    :user_id,
                                    :_destroy]
    )
  end
end
