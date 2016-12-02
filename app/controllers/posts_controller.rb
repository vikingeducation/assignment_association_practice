class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @category_options = Category.all.map { |c| [c.name, c.id] }
    @post = Post.new
    @comment = @post.comments.build
  end

  def create
    # create comment

    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post successfully created!"
      redirect_to post_path(@post)
    else
      flash.now[:error] = "Check your fields again"
      render :new
    end
  end

  def edit
    @category_options = Category.all.map { |c| [c.name, c.id] }
    @post = Post.find_by_id(params[:id])
    # @post.comments.build
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post successfully updated!"
      redirect_to post_path(@post)
    else
      flash.now[:error] = "Check your fields again"
      render :edit
    end
  end

  private

  def post_params
    params.
      require(:post).
      permit( :title,
              :body,
              :category_id,
              :tag_ids => [],
              :comments_attributes => [ :id, :body ] )
  end

end
