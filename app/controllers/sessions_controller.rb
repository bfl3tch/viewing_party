class SessionsController < ApplicationController
  def new
  end

  def create
    # require "pry"; binding.pry
    found_user = User.find_by(username: params[:username])
    if found_user && found_user.authenticate(params[:password])
      flash[:success] = "Welcome, #{found_user.username}!"
      session[:user_id] = found_user.id
      redirect_to dashboard_path
      # require "pry"; binding.pry
    else
      flash[:error] = found_user.errors.full_messages.to_sentence
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
