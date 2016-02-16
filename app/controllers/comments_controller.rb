class CommentsController < ApplicationController
  def index
    @comments = Game.find(params[:game_id]).comments
  end

  def create
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

  def destroy
    game = Game.find(params[:game_id])
    Comment.find(params[:id]).destroy
    redirect_to game_path(game)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
