class PostController < ApplicationController
  def new
    @post = Post.new
  end

  def create
  end

  def edit
  end

  def show
  end

private
  def post_params
    params.require(:post).permit(:title, :body, :tag_ids => [] )
  end
end
