class PostsController < ApplicationController

  def new
    @post=Post.new
  end

  def edit
    @post=Post.find(params[:id])

  end

  def update
    @post=Post.find(params[:id])
    @post.update(whiteparams)
    if @post.save
      flash[:success]="Updated"
      redirect_to posts_path
    else
      flash[:failure]="Not updated"
      render :edit
    end
  end

  def show

  end

  private

  def whiteparams
    params.require(:post).permit(:title, :body, :tag_ids => [])
  end
end
