class PostsController < ApplicationController
  def index
    @category = Category.find_by_name(params[:category_name])
    redirect_to root_url if !@category
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

  def edit
    @categories = Category.all
    @post = Post.find_by_token(params[:token])
    redirect_to root_path if !@post
  end

  def update
    @post = Post.find_by_token(params[:token])
    @post.update_attributes(params[:post])
    if @post.save
      flash[:success] = "Successfully Updated Post"
      redirect_to post_path(@post.category.name, @post)
    else
      render 'edit'
    end

  end


end
