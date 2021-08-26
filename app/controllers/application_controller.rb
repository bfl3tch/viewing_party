class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def user_login
    if !current_user
      redirect_to root_path, message: 'Please Login'
    end
  end
end
