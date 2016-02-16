class StashController < ApplicationController
  def index
    @stashes = Stash.all
  end

  def create
    user = User.find(params[:user_id])
    game = Game.find(params[:game_id]) # Need to clarify what params will be called
    user.games << game
    redirect_to user_path(user)
  end

  def destroy
  end
end
