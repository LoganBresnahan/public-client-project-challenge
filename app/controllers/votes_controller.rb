class VotesController < ApplicationController
  
  include VotingHelper

  def upvote
    @game = Game.find_by(id: params[:id])
    @vote = current_user.votes.new(game: @game, value: 1)
    respond_to_voting
  end

  def downvote
    @game = Game.find_by(id: params[:id])
    @vote = current_user.votes.new(game: @game, value: -1)
    respond_to_voting
  end
end