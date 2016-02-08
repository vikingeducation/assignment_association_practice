class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.comments.build
    @post_options = Category.all.map {|category| [category.name, category.id]}
  end

  def create
    @post = Post.new(post_params)
    @post_options = Category.all.map {|category| [category.name, category.id]}
    if @post.save
      redirect_to @post, notice: "Post successfully created!"
    else
      flash.now[:alert] = "Post creation failed!"
      render :new
    end
  end


  def edit
    @post = Post.find(params[:id])
    @post.comments.build
    @post_options = Category.all.map {|category| [category.name, category.id]}
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post_options = Category.all.map {|category| [category.name, category.id]}
    if @post.update(post_params)
      redirect_to @post, notice: "Post successfully updated!"
    else
      flash.now[:alert] = "Post update failed!"
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, tag_ids: [],
                                comments_attributes: [:id, :body, :_destroy] )
  end
end
