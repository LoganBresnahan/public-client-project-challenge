class UsersController < ApplicationController
  def index
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
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
    user.update_attributes(user_params)
    redirect_to user_path(user)
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def destroy
    User.find(session[:user_id]).destroy
    flash[:success] = "User terminated"
    redirect_to '/users/new'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
