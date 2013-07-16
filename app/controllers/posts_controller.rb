class PostsController < ApplicationController
  def index
    @category = Category.find_by_name(params[:category_name])
    redirect_to root_url if !@category
  end

  def show
    @category = Category.find_by_name(params[:category_name])
    @post = params[:id] ? Post.find(params[:id]) : Post.find_by_token(params[:token])
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

  def token

  end
end
