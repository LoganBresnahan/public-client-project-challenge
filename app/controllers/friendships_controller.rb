class FriendshipsController < ApplicationController
  def new
  end

  def create
    friend = User.find(params[:user_id])
    current_user.friends << friend
    redirect_to user_path(friend)
  end

  def destroy
    burn_bridge = Friendship.find(params[:id])
    burn_bridge.destroy
    redirect_to user_path(session[:user_id])
  end
end
