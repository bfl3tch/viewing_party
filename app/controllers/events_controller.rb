class EventsController < ApplicationController
  def new; end

  def create
    @event = Event.new(event_params)
    if @event.save
      EventsFacade.create_attendees(params[:friends], @event) if params[:friends]
      EventsFacade.create_attendee(current_user, @event)
      # EventNotifierMailer.new_event_email(current_user, params[:friends], @event).deliver
      redirect_to dashboard_path, flash: { notice: "Virtual Watch Party for #{@event.title} Created!" }
      session[:movie_id] = nil
    else
      @movie = APIS::MoviesFacade.find_by_title(params[:query])
      flash.now[:errors] = @event.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def event_params
    params.permit(:title, :user_id, :duration, :day, :start_time)
  end
end
