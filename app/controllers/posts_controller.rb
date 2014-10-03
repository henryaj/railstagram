class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params[:post].permit(:caption, :filepicker_url))
    redirect_to posts_path
  end
  
end
