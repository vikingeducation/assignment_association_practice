class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @comment = @post.comments.build
    @tag_options = Tag.all.map{|tag| [ tag.name, tag.id ] }
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "successfully created!"
    else
      flash.now[:alert] = "there was a problem"
      render :new
    end
  end

  def edit
    @post.comments.build
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "successfully updated!"
    else
      flash.now[:alert] = "there was a problem"
      render :edit
    end
  end

  def show
    @tags = @post.tags
    @comments = @post.comments
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :tag_ids => [], :comments_attributes => [:author_id, :body, :id, :_destroy])
  end
end
