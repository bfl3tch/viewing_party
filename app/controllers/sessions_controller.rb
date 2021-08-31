class SessionsController < ApplicationController
  skip_before_action :user_login

  def new
  end

  def create
    found_user = User.find_by(username: params[:username])
    if found_user && found_user.authenticate(params[:password])
      flash[:success] = "Welcome, #{found_user.username}!"
      session[:user_id] = found_user.id
      redirect_to dashboard_path
    elsif found_user && !found_user.authenticate(params[:password])
      flash[:error] = "Your password is incorrect, try again."
      redirect_to root_path
    else
      flash[:error] = "That account doesn't exist, try registering it."
      redirect_to root_path
    end
  end

  def destroy
    flash[:success] = "Goodbye, #{current_user.username}!"
    session[:user_id] = nil
    redirect_to root_path
  end
end
