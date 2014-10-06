class UsersController < ApplicationController

  def show
    @user = current_user
    @posts = current_user.posts.all
  end
  
end
