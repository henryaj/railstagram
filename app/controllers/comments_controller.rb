class CommentsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :create

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:text))
    @comment.username = current_user.username
    @comment.save
    render json: {comment: @comment.text, username: @comment.username}
  end

end
