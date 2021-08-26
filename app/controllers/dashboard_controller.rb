class DashboardController < ApplicationController
  before_action :user_login

  def show
    require "pry"; binding.pry
    @user = current_user
  end
end
