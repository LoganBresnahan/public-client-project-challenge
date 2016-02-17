class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:welcome] = "(╯✧∇✧)╯ Welcome!"
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "User was not created. Try again."
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages.to_sentence
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def destroy
    User.find(session[:user_id]).destroy
    reset_session
    flash[:success] = "User terminated"
    redirect_to '/users/new'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
