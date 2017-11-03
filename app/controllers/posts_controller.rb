class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      flash[:success] = "Post '#{@post.title}' created"
      redirect_to post_path @post
    else
      flash[:error] = "Didn't create post!"
      render :new
    end
  end

  def edit

  end

  def show
    render :show, locals: { post: Post.find(params[:id]) }
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, tag_ids: [])
  end
end
