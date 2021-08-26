class DashboardController < ApplicationController
  before_action :user_login

  def show
    @user = current_user
    @friends = @user.friends
  end
end
