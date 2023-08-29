class EventsController < ApplicationController
  def index
    @events = Events.all
  end

  def show
  end
end
