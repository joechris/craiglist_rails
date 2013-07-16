class PostsController < ApplicationController
  def index
    @posts = Category.find_by_name(params[:category_name]).posts
  end

  def show

  end


end
