class EventsController < ApplicationController

  def new
    @user = current_user
    @movie = API.movie_by_id(params[:movie_id])
  end

  def create
    @event = Event.create(event_params)
  end

  private

  def event_params
    params.require(:event).permit(:title, :user_id, :duration, :day, :start_time)
  end
end
