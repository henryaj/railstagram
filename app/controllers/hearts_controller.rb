class HeartsController < ApplicationController

  def new
    @comment = Comment.find(params[:comment_id])
    @heart = @comment.hearts.create
    redirect_to '/'
  end

end
