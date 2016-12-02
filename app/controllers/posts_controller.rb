class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.comments.build()
  end

  def edit
    @post = Post.find(params[:id])
    @post.comments.build
  end

  def create
    @post = Post.new( post_params )

    if @post.save
      flash[:success] = "Post Saved!"
      redirect_to @post
    else
      flash.now[:error] = "Failed to save post!"
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update( post_params )
      flash[:success] = "Post Saved!"
      redirect_to @post
    else
      flash.now[:error] = "Failed to save post!"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

    def post_params
      params.require(:post)
            .permit( :title,
                     :body,
                     :category_id,
                     { tag_ids: [] },
                     { :comments_attributes => [:body,
                                                :author_id,
                                                :post_id,
                                                :id,
                                                :_destroy] } )
    end
end
