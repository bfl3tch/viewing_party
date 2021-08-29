class EventsController < ApplicationController

  def new
    @user = current_user
    @movie = API.movie_by_id(params[:movie_id])
  end

  def create

  end
end
