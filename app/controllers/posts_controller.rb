class PostsController < ApplicationController
  def new
    @post = Post.new
    @post.comments.build
    @category_options = Category.all.map {|c| [c.name] }
  end

  def create
    @post = Post.new(white_listed_params)

    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = @post.comments
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    @post.comments.build

    @category_options = Category.all.map {|c| [c.name] }
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(white_listed_params)
      redirect_to @post
    else
      render "edit"
    end
  end

  private
  def white_listed_params
    params.require(:post).permit(:title, :body, { :tag_ids => [], :comments_attributes => [ :id, :body, :user_id, :_destroy ]} )
  end
end
