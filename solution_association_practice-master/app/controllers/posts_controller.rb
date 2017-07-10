class PostsController < ApplicationController
  before_action :set_post, :except => [:index]
  before_action :build_comment, :only => [:new, :edit]

  def index
    @posts = Post.order(:created_at)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @post.save
#     if @post.update(post_params) ... originally this, looks wrong
      redirect_to(post_path(@post), :flash => {:success => 'Post created'})
    else
      flash.now[:error] = 'Post not created'
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to(post_path(@post), :flash => {:success => 'Post updated'})
    else
      flash.now[:error] = 'Post not updated'
      render :edit
    end
  end

  def destroy
    message = @post.destroy ? {:success => 'Post deleted'} : {:error => 'Post not deleted'}
    redirect_to(posts_path, :flash => message)
  end


  private
  def set_post
    @post = Post.exists?(params[:id]) ? Post.find(params[:id]) : Post.new
  end

  def build_comment
    @post.comments.build
  end

  def post_params
    params.require(:post)
      .permit(
        :title,
        :body,
        :category_id,
        :tag_ids => [],
        :comments_attributes => [
          :id,
          :body,
          :user_id,
          :_destroy
        ]
      )
  end
end
