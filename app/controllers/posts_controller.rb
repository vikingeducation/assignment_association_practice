class PostsController < ApplicationController

	include PostsHelper

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(posts_params)
		params[:post][:tag_ids].each do |tag_id|
			tagging = Tagging.new
			tagging.post_id = @post.id
			tagging.tag_id = tag_id
			tagging.save!
		end
		if @post.save!
			flash[:success] = "Post created successfully"
			redirect_to posts_path
		else
			flash[:error] = "Post creation failed"
			render action: "new"
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(posts_params)
			flash[:success] = "Great! Your post has been updated!"
			redirect_to posts_path
		else
			flash[:error] = "Could not update!"
			render action: "edit"
		end
	end

end
