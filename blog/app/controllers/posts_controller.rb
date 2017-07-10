# blog application

class PostsController < ApplicationController

  def index
    @posts = Post.all.order(:created_at)
  end

  def new
    @post = Post.new
    @comment = @post.comments.build
  end

  def create
    @post = Post.new(whitelisted_post_params)
    if @post.save
#      puts "saved" ... for testing
      flash[:success] = "Success! Post and nested comment(s) created"
      redirect_to @post
    else
#      puts @post.errors.full_messages ... for tsting
      flash.now[:error] = "Error! Post  and nested comment(s) not created"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(whitelisted_post_params)
      puts "updated"
      flash[:success] = "Success! Post and nested comment(s) updated"
      redirect_to @post
    else
      puts @post.errors.full_messages
      flash.now[:error] = "Failure! Post  and nested comment(s) not updated"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Success! Post  and nested comment(s) deleted"
    else
      flash[:error] = "Failure! Post  and nested comment(s) not deleted"
    end
    redirect_to posts_path
  end

  private

  def whitelisted_post_params
    puts params
    params.require(:post).permit(:title, :body, :category_id, 
      :tag_ids => [],
      comments_attributes: [:body, :author_id, :post_id, 
        :id, :_destroy])
  end

end

