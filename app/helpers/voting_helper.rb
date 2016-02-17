module VotingHelper
  def respond_to_voting
    if @vote.save
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