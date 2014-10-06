class HeartsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :create
  
  def new
    @comment = Comment.find(params[:comment_id])
    @heart = @comment.hearts.create
    render json: {number_hearts: @comment.hearts.count}
  end

  def create
    @comment = Comment.find(params[:comment_id])
    @heart = @comment.hearts.create
    render json: {number_hearts: @comment.hearts.count}
  end


end
