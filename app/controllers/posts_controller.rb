class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def edit
    #
  end

  def create
    @post.new( post_params )

    if @post.save
      flash[:success] = "Post Saved!"
      redirect_to @post
    else
      flash.now[:error] = "Failed to save post!"
      render :new
    end
  end

  def show
    #
  end

  private

    def post_params
      params.require(:post)
            .permit( :title,
                     :body,
                     tag_ids: [] )
    end
end
