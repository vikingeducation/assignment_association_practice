class PostsController < ApplicationController
  def new
  	@post = Post.new
  	@author_options = create_author_options
  	@tag_options = create_tag_options
  end

  def create
  	@post = Post.new(whitelist_params)
  	if @post.save
  		flash[:success] = "new post created"
  		redirect_to post_path(@post.id)
  	else
  		flash.now[:error] = "post creation failed"
  		render :new
  	end
  end

  def edit
  	@post = Post.find(params[:id])
  	@author_options = create_author_options
  	@tag_options = create_tag_options
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(whitelist_params)
  		flash[:success] = "update successful"
  		redirect_to post_path(@post.id)
  	else
  		flash.now[:error] = "update failed"
  		render :edit
  	end
  end

  def show
  	@post = Post.find(params[:id])
  end

  def index
  	@posts = Post.all
  end

  private

  def whitelist_params
  	params.require(:post).permit(:title, :body, :tag_ids => [], :author_ids => [])
  end

  def create_author_options
  	User.all.map{|user| [user.name, user.id]}
  end

  def create_tag_options
  	Tag.all.map{|tag| [tag.name, tag.id]}
  end
end
