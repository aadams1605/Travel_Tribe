class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    @event = Event.new
    if params[:query].present?
      sql_subquery = "title ILIKE :query OR location ILIKE :query"
      @events = Event.where(sql_subquery, query: "%#{params[:query]}%")
    end

    @no_results = @events.empty?

    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {event: event})
      }
    end
  end

  def show
    @attendees = @event.attendees
    @chatroom = @event.chatroom
    @marker = [{
      lat: @event.latitude,
      lng: @event.longitude
    }]
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @attendees = @event.attendees.to_a
    @event.destroy
    @attendees.each do |attendee|
      Notification.create(
        content: "The event #{@event.title} has been cancelled by #{@event.user.username}",
        user: attendee,
        notifiable_type: attendee.class.name,
        notifiable_id: attendee.id
      )
    end
    redirect_to root_path, alert: "Event was successfully deleted."
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :location, :start_date, :end_date, :capacity, :photo)
  end
end
