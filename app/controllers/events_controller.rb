class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params_create)
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

  def event_params_create
    params.require(:event).permit(:location, :description, :start_date, :end_date, :title, :capacity, photos:[])
  end

end
