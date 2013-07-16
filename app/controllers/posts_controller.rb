class PostsController < ApplicationController
  def index
    @category = Category.find_by_name(params[:category_name])
    # @posts = Category.find_by_name(params[:category_name]).posts
  end

  def show
    @category = Category.find_by_name(params[:category_name])
    @post = Post.find(params[:id])
  end

  def new
    @categories = Category.all
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:success] = "Successfully create a new post"
      redirect_to post_path(@post.category.name, @post)
    else
      render 'new'
    end

  end


end
