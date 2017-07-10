class StaticPagesController < ApplicationController
  def index
  end

  def update
    @params = params
    render :index
  end
end
