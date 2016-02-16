module CurrentUserHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def has_game?(game)
    current_user.games.include?(game) ? true : false
  end

  def user_stash(game)
    Stash.where(user: current_user, game: game).first
  end

end
