class PostsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(params[:post].permit(:caption, :filepicker_url, :tag_list))
    @post.username = current_user.username
    @post.save
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:id])
  end
  
end
