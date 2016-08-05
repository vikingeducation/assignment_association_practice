class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @category_options = Category.all.map{|c| [ c.name, c.id ] }
    @tag_options = Tag.all.map{|t| [ t.name, t.id ] }

  end

  def create
    @post = Post.new(white_listed_post_params)
    if @post.save
      flash[:success] = "its been created"
      redirect_to @post
    else
      flash.now[:error] = "somethings wrong"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @category_options = Category.all.map{|c| [ c.name, c.id ] }
    @tag_options = Tag.all.map{|t| [ t.name, t.id ] }

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(white_listed_post_params)
      flash[:success] = "Update successful"
      redirect_to @post
    else
      flash[:error] = "YOu have an error"
      render :edit
    end
  end

  private

    def white_listed_post_params
      params.require(:post).permit(:title, :body,  :category_id, tag_ids: [] )
    end
end
