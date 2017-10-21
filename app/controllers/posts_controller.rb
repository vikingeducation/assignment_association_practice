class PostsController < ApplicationController

	def index 
		@posts = Post.all
	end
	def new
		@post = Post.new
	end

	def edit
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:success] = "Post created"
			redirect_to post_path(@post.id)

		else
			flash.now[:error] = "Failed to create new post"
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def update
		if @post.update(post_params)
		
			flash[:success] = "Post updated"
			redirect_to post_path(@post)
		else
			flash.now[:error] = "Post not updated"
			render :edit
		end

	end

	private 

	def post_params
		params.require(:post).permit(
			:title, 
			:body,
			:category_id,
			:user_id,
			:tag_ids => [])
    end
end
