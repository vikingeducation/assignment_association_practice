class PostsController < ApplicationController

  def new
    @post = Post.new
    @category_options = Category.all.map{|c| [ c.name, c.id ] }
    @tag_options = Tag.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @post = Post.new(post_params)
    @category_options = Category.all.map{|c| [ c.name, c.id ] }
    @tag_options = Tag.all.map{|c| [ c.name, c.id ] }

    if @post.save
      flash[:success] = "A new User has been created!"
      @post = Post.new
      render :new
    else
      flash[:error] = "User creation failed! Correct your errors!"
      @post = Post.new
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @category_options = Category.all.map{|c| [ c.name, c.id ] }
    @tag_options = Tag.all.map{|c| [ c.name, c.id ] }
  end

  def update
    @post = Post.find(params[:id])
    @post1 = Post.first
    @category_options = Category.all.map{|c| [ c.name, c.id ] }
    @tag_options = Tag.all.map{|c| [ c.name, c.id ] }
    if @post.update(post_params)
      flash[:success] = "User has been updated!"
      @post = Post.new
      render :new
    else
      flash[:error] = "User update failed! Correct your errors!"
      @post = Post.new
      render :new
    end

  end

  def show

  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :tag_ids => [])
  end



end
