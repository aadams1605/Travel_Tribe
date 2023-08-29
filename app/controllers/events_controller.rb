class EventsController < ApplicationController
before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  def index
    @events = Events.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    ##if params[:event][:photos].present?
      # params[:event][:photos].each do |photo|
      #   @event.photos.attach(photo)
      #   @event.location
      #   @event.description
      #   @event.start_date
      #   @event.end_date
     # end
    # end
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
  
  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :location, :start_date, :end_date, :capacity)
  end
end
