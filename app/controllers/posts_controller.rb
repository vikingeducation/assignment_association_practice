class PostsController < ApplicationController
  def index
  end

  def show
  end

  def edit
    @author_options = author_options
    @post = Post.find(params[:id])
    @post.comments.build
  end

  def update
  
    @post = Post.find(params[:id])
    if @post.update(whitelisted_params)
      flash[:success] = "Post successfully updated"
      redirect_to posts_path
    else
      flash[:error] = "Something went wrong"
      render :edit
    end
  end

  def new

    @author_options = author_options
    @post = Post.new
    @post.comments.build
  end

  def create
    @post = Post.new(whitelisted_params)
    if @post.save
      flash[:success] = "Post successfully created"
      redirect_to posts_path
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  private

  def whitelisted_params
    params.require(:post).permit(:title, :body,
                                 :category_id,
                                 :tag_ids => [],
                                 :comments_attributes => [:body, :user_id,
                                  :_destroy, :id])
  end

  def author_options
    @author_options = User.all.map { |user| [user.name, user.id] }
  end
end
