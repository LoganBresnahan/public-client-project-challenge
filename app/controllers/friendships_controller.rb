class FriendshipsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(id: session[:user_id])
    friend = User.find(params[:user_id])
    user.friends << friend
    redirect_to user_path(friend)
  end

  def destroy
    burn_bridge = Friendship.find(params[:id])
    burn_bridge.destroy
    redirect_to user_path(session[:user_id])
  end
end
