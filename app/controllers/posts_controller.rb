class PostsController < ApplicationController

  def new
    @post=Post.new
    @author_options = User.all.map{|u| [ u.name, u.id ] }
    @authors=User.all
  end

  def edit
    @post=Post.find(params[:id])

  end

  def update
    @post=Post.find(params[:id])
    if @post.update(whiteparams)
      flash[:success]="Updated"
      redirect_to post_path(@post.id)
    else
      flash[:failure]="Not updated"
      render :edit
    end
  end

  def show
    @post=Post.find(params[:id])
  end

  private

  def whiteparams
    params.require(:post).permit(:title, :body, :authors, :tag_ids => [])
  end
end
