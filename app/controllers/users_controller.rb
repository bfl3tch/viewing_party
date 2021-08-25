class UsersController < ApplicationController
  def index
  end

  def new
      @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user_params)
    if new_user.save
      # require "pry"; binding.pry
      flash[:success] = "Welcome, #{new_user.username}"
      redirect_to dashboard_path(new_user.id)
    else
      redirect_to registration_path
      flash[:failure] = "Please fill out all fields"
      # render "new"
    end
  end

  def login
    user = User.find_by(username: params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}!"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad."
      # render :login
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
