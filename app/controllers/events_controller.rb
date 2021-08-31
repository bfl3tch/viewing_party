class EventsController < ApplicationController

  def new
    # require "pry"; binding.pry
    # @user = current_user
    # @movie = MoviesService.movie_by_id(params[:movie_id])
  end

  def create
    @event = Event.new(event_params)
    # require "pry"; binding.pry
    if @event.save && params[:friends]
      params[:friends].each { |f| Attendee.create(user_id: f.to_i, event_id: @event.id) }
      Attendee.create(user_id: current_user.id, event_id: @event.id)
      redirect_to dashboard_path, flash: { notice: "Virtual Watch Party for #{@event.title} Created!" }
      session[:movie_id] = nil
    elsif @event.save
      Attendee.create(user_id: current_user.id, event_id: @event.id)
      redirect_to dashboard_path, flash: { notice: "Virtual Watch Party for #{@event.title} Created!" }
      session[:movie_id] = nil
    else
      @movie = MoviesService.movie_by_id(params[:movie_id])
      flash.now[:errors] = @event.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def event_params
    params.permit(:title, :user_id, :duration, :day, :start_time)
  end

end
