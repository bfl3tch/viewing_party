class UsersController < ApplicationController
  # def index; end

  def new
    @user = User.new
  end

  # def show
  #   @user = User.find(params[:id])
  # end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user_params)
    if new_user.save
      flash[:success] = "Welcome, #{new_user.username}"
      redirect_to dashboard_path(new_user.id)
    else
      flash[:error] = new_user.errors.full_messages.to_sentence
      redirect_to registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end
end
