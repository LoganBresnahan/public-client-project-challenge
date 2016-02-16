class StashesController < ApplicationController
  def index
    @stashes = Stash.all
  end

  def new
  end

  def create
    user = User.find(params[:user_id])
    game = Game.find(params[:game_id]) # Need to clarify what params will be called
    if !user.games.find_by(id: game.id)
      user.games << game
    else
      flash[:alert] = "Game already exists in your collection"
    end
    redirect_to games_path
  end

  def destroy
  end
end
