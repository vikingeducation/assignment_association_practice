class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @tagged_posts = Tag.find(params[:id]).posts
  end
end
