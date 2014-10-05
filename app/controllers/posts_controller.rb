class PostsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:caption, :filepicker_url))
    @post.username = current_user.username
    @post.save
    respond_to do |format|
        format.html { redirect_to post_path(@post) }
      end
  end

  def show
    @post = Post.find(params[:id])
  end
  
end
