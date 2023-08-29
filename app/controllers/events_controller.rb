class EventsController < ApplicationController
  def index
    @events = Events.all
  end

  def show
  end
end

private

def set_event
  @event = Event.find(params[:id])
end

def event_params
  params.require(:event).permit(:title, :description, :location, :start_date, :end_date, :capacity)
end
