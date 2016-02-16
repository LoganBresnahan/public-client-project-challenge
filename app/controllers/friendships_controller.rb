class FriendshipsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(id: session[:user_id])
    friend = User.find(params[:user_id])
    user.friends << friend
    redirect_to user_path(friend)
  end
end
