class EventsController < ApplicationController
  def new; end

  def create
    @event = Event.new(event_params)
    if @event.save && params[:friends]
      EventsFacade.create_attendees(params[:friends], @event)
      EventsFacade.create_attendee(current_user, @event)
      EventNotifierMailer.new_event_email(current_user, params[:friends], @event).deliver
      redirect_to dashboard_path, flash: { notice: "Virtual Watch Party for #{@event.title} Created!" }
      session[:movie_id] = nil
    elsif @event.save
      EventsFacade.create_attendee(current_user, @event)
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
