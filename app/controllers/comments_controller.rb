class CommentsController < ApplicationController
  def index
  end

  def create
    p params
    p "*********************"
    current_user = User.find(session[:user_id])
    game = Game.find(params[:game_id])
    @comment = current_user.comments.build(comment_params)
    @comment.game = game
    if @comment.save
      redirect_to game_path(game)
    else
      flash[:alert] = "Comment did not save."
      redirect_to game_path(game)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
