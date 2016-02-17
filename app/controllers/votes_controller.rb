class VotesController < ApplicationController
  


  # Not DRY, needs refactoring
  def upvote
    @game = Game.find_by(id: params[:id])
    vote = current_user.votes.new(game: @game, value: 1)
    if vote.save
      @new_score = @game.vote_score
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js {render nothing: true}
      end
    end
  end

  def downvote
    @game = Game.find_by(id: params[:id])
    vote = current_user.votes.new(game: @game, value: -1)
    if vote.save
      @new_score = @game.vote_score
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js {render nothing: true}
      end
    end
  end
end