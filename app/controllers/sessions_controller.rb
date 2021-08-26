class SessionsController < ApplicationController
  def new; end

  def create
    found_user = User.find_by(username: params[:username])
    if found_user.authenticate(params[:password])
      session[:user_id] = found_user.id
      redirect_to dashboard_path(found_user.id)
      flash[:success] = "Welcome, #{found_user.username}!"
    else
      redirect_to login_path
      flash[:error] = found_user.errors.full_messages.to_sentence
      # render :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
